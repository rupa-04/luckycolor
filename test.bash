#!/bin/bash

set -e

COLORS=$(awk '/COLORS *= *\[/,/\]/' luckycolor.py | sed -E 's/.*COLORS *= *//' | tr -d '\n')

get_color(){
	local n="$1"
	python3 - <<EOF
import sys, ast
colors = ast.literal_eval('$COLORS')
name, hexcode = colors[$n % len(colors)]
print(name, hexcode)
EOF
}

run_cmd(){
	local opts="$1"
	local input="$2"
	echo -n "$input" | python3 luckycolor.py $opts
}

echo "Loaded COLORS from luckycolor.py: $COLORS"

read expected_name expected_hex <<<"$(get_color 5)"
out=$(run_cmd "" "5")

if [ "$out" != "$expected_name" ]; then
	echo "Test basic FAILED: expected '$expected_name' but got '$out'"
	exit 1
else
	echo "Test basic PASSED"
fi


out=$(run_cmd "-x" "5")

if [ "$out" != "$expected_hex" ]; then
	echo "Test hex FAILED: expected '$expected_hex' but got '$out'"
	exit 1
else
	echo "Test hex PASSED"
fi


out=$(run_cmd "-v" "3")
read name3 hex3 <<<"$(get_color 3)"

if [[ "$out" != *"$name3"* ]] || [[ "$out" != *"$hex3"* ]]; then
	echo "verbose FAILED:"
	echo "expected message to include '$name3' and '$hex3'"
	echo "but got: $out"
	exit 1
else
	echo "Test verbose PASSED"
fi


echo "All tests PASSED successfully!"
