fjq() {
  local content
  if [[ -z "$1" ]]; then
    echo "Second param must be json file path or content"
    return 1
  elif [ -f "$1" ]; then
    content=$(cat "$1")
  else
    content="$1"
  fi
  (export json="$content"; echo '' | fzf --print-query --preview-window=wrap --preview='jq {q} <(printf "%s" "$json")')
}


