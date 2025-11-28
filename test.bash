#!/bin/bash

set -e

COLORS=$(grep -E "COLORS\s*=" main.py | sed -E 's/.*=\s*//')

get_color(){
	local n="$1"
	python - <<EOF
import sys, ast
colors = ast.literal_eval($COLORS)
idx = $n % len(colors)
print(colors[idx])
EOF
}

run_cmd(){
	echo -n "$2" | python main.py "${@:3}"
}

echo "Loaded COLORS from main.py: $COLORS"

expected=$(get_color 5)
out=$(run_cmd "" "5")

if [ "$out" != "$expected" ]; then
	echo "Test basic FAILED: expected '$expected' but got '$out'"
	exit 1
else
	echo "Test basic PASSED"
fi


out=$(run_cmd "-x" "5")

if [[ "$out" != \#* ]]; then
	echo "Test hex FAILED: expected a hex color (starting with #) but got '$out'"
	exit 1
else
	echo "Test hex PASSED"
fi


out=$(run_cmd "-v" "3")

lower_out=$(echo "$out" | tr '[:upper:]' '[:lower:]')
if [[ "$lower_out" != *"lucky color"* ]]; then
	echo "Test verbose FAILED: missing 'lucky color' in output"
	exit 1
else
	echo "Test verbose PASSED"
fi


echo "All tests PASSED successfully!"
