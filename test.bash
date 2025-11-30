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

echo "luckycolor.py: $COLORS から読み込みます。"

read expected_name expected_hex <<<"$(get_color 5)"
out=$(run_cmd "" "5")

if [ "$out" != "$expected_name" ]; then
	echo "最初のテストが失敗しました。'$expected_name'の予想でしたが、'$out'と出ました。"
	exit 1
else
	echo "最初のテストが成功しました。"
fi


out=$(run_cmd "-x" "5")

if [ "$out" != "$expected_hex" ]; then
	echo "二つ目のhexコードのテストが失敗しました。'$expected_hex'の予想でしたが、'$out'と出ました。"
	exit 1
else
	echo "二つ目のhexコードのテストが成功しました。"
fi


out=$(run_cmd "-v" "3")
read name3 hex3 <<<"$(get_color 3)"

if [[ "$out" != *"$name3"* ]] || [[ "$out" != *"$hex3"* ]]; then
	echo "三つ目のメッセージ表示のテストが失敗しました。"
	echo "予想されたメッセージと'$name3'と'$hex3'"
	echo "の表示でしたが、'$out'と出ました。"
	exit 1
else
	echo "三つ目のメッセージ表示のテストが成功しました。"
fi


echo "すべてのテストに成功しました!"
