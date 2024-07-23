#!/bin/sh
echo -ne '\033c\033]0;playground\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/bombseeker-prototype-0.0.1.linux.x86_64" "$@"
