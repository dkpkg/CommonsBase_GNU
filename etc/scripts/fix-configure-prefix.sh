#!/bin/sh
set -eu

if [ "${1:-}" = "--prune-m4-subdirs" ]; then
  shift
  sed -i 's/^SUBDIRS = \. examples lib src doc checks po tests$/SUBDIRS = . examples lib src doc checks po/' "$1"
  exit 0
fi

prefix=$1
shift

prefix_slash=$(printf '%s' "$prefix" | tr '\\' '/')
script_file=fix-configure-prefix.sed

printf 's@^prefix.*@prefix=%s@\n' "$prefix_slash" > "$script_file"
sed -f "$script_file" --in-place "$@"
rm -f "$script_file"
