#!/bin/bash
#SPDX-FileCopyrightText: 2025 rupa-04
#SPDX-License-Identifier: BSD-3-Clause

set -e

# basic test
out=$(echo 5 | ./luckycolor)
if [ "$out" != "yellow" ]; then
	echo "FAILED basic"
	exit 1
fi

# hex test
out=$(echo 5 | ./luckycolor -x)
if [ "$out" != "#ffd60a" ]; then
	echo "FAILED hex"
	exit 1
fi

# verbose test
out=$(echo 3 | ./luckycolor -v)
if [[ "$out" != *"あなたのラッキーカラーは"* ]]; then
	echo "FAILED verbose"
	exit 1
fi

echo "OK"
