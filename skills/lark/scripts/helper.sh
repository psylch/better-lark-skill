#!/usr/bin/env bash
# Helper script for lark skill
# Provides environment detection and profile management.
# All output is JSON to stdout, errors to stderr.

set -euo pipefail
CONFIG_DIR="$HOME/.lark-cli"

case "${1:-}" in
  preflight)
    errors=()

    # Check lark-cli installed
    if command -v lark-cli &>/dev/null; then
      cli_ok=true
      cli_version=$(lark-cli --version 2>/dev/null || echo "unknown")
    else
      cli_ok=false
      cli_version=""
      errors+=("lark-cli not installed")
    fi

    # Check config dir
    if [ -d "$CONFIG_DIR" ]; then
      config_ok=true
    else
      config_ok=false
      errors+=("~/.lark-cli directory not found")
    fi

    # List profiles
    profiles="[]"
    if [ -d "$CONFIG_DIR" ]; then
      profile_entries=()
      for f in "$CONFIG_DIR"/config-*.json; do
        [ -f "$f" ] || continue
        name=$(basename "$f" .json | sed 's/config-//')
        app_id=$(python3 -c "import json; d=json.load(open('$f')); print(d['apps'][0]['appId'])" 2>/dev/null || echo "?")
        has_secret="false"
        [ -f "$CONFIG_DIR/.$name.secret" ] && has_secret="true"
        profile_entries+=("{\"name\":\"$name\",\"appId\":\"$app_id\",\"hasSecret\":$has_secret}")
      done
      if [ ${#profile_entries[@]} -gt 0 ]; then
        profiles=$(printf '%s\n' "${profile_entries[@]}" | paste -sd, - | sed 's/^/[/;s/$/]/')
      fi
    fi

    # Check switch.sh exists
    switch_ok=false
    [ -f "$CONFIG_DIR/switch.sh" ] && switch_ok=true

    # Current profile
    current_app_id=""
    if [ -f "$CONFIG_DIR/config.json" ]; then
      current_app_id=$(python3 -c "import json; d=json.load(open('$CONFIG_DIR/config.json')); print(d['apps'][0]['appId'])" 2>/dev/null || echo "?")
    fi

    ready=true
    hint="All checks passed"
    if [ ${#errors[@]} -gt 0 ]; then
      ready=false
      hint=$(printf '%s; ' "${errors[@]}")
    fi

    cat <<EOJSON
{
  "ready": $ready,
  "hint": "$hint",
  "dependencies": {
    "lark-cli": {"ok": $cli_ok, "version": "$cli_version"},
    "config_dir": {"ok": $config_ok},
    "switch_sh": {"ok": $switch_ok}
  },
  "profiles": $profiles,
  "currentAppId": "$current_app_id"
}
EOJSON
    ;;

  restore-keychain)
    profile="${2:-}"
    if [ -z "$profile" ]; then
      echo '{"error": "missing_profile", "hint": "Usage: helper.sh restore-keychain <profile>"}' >&2
      exit 2
    fi
    secret_file="$CONFIG_DIR/.$profile.secret"
    config_file="$CONFIG_DIR/config-$profile.json"
    if [ ! -f "$secret_file" ]; then
      echo "{\"error\": \"no_secret_file\", \"hint\": \"$secret_file not found\"}" >&2
      exit 1
    fi
    if [ ! -f "$config_file" ]; then
      echo "{\"error\": \"no_config_file\", \"hint\": \"$config_file not found\"}" >&2
      exit 1
    fi
    app_id=$(python3 -c "import json; d=json.load(open('$config_file')); print(d['apps'][0]['appId'])" 2>/dev/null)
    secret=$(cat "$secret_file")
    keychain_key="lark-cli/appsecret:$app_id"
    security delete-generic-password -s "$keychain_key" 2>/dev/null || true
    security add-generic-password -s "$keychain_key" -a "$app_id" -w "$secret" 2>/dev/null
    echo "{\"ok\": true, \"profile\": \"$profile\", \"appId\": \"$app_id\"}"
    ;;

  *)
    echo '{"error": "unknown_command", "hint": "Usage: helper.sh preflight | restore-keychain <profile>"}' >&2
    exit 2
    ;;
esac
