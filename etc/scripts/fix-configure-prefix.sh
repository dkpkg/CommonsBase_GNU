#!/bin/sh
set -eu

prefix=$1
shift

prefix_slash=$(printf '%s' "$prefix" | tr '\\' '/')
script_file=fix-configure-prefix.sed

printf 's@^prefix.*@prefix=%s@\n' "$prefix_slash" > "$script_file"
sed -f "$script_file" --in-place "$@"
rm -f "$script_file"
