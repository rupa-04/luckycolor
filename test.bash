#!/bin/bash
#SPDX-FileCopyrightText: 2025 rupa-04
#SPDX-License-Identifier: BSD-3-Clause

ng () {
	echo ${1}行目が違うよ
	res=1
}

res=0

# basic test
out=$(echo 5 | ./luckycolor)
[ "$?" -eq 0 ] || ng "$LINENO"
[ "$out" = "orange" ] || ng "$LINENO"

# hex test
out=$(echo 5 | ./luckycolor -x)
[ "$?" -eq 0 ] || ng "$LINENO"
[ "$out" != "#ff9500" ]

# verbose test
out=$(echo 3 | ./luckycolor -v)
[ "$?" -eq 0 ] || ng "$LINENO"
[[ "$out" == *"あなたのラッキーカラーは"* ]] || ng "$LINENO"

# not correct test
out=$(echo abc | ./luckycolor 2>/dev/null)
[ "$?" -ne 0 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

out=$(echo | ./luckycolor 2>/dev/null)
[ "$?" -ne 0 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK

exit $res
