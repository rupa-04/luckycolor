#!/usr/bin/python3
#SPDX-FileCopyrightText: 2025 rupa-04
#SPDX-License-Identifier: BSD-3-Clause

import sys
import argparse

COLORS = [
        ("red", "#ff4b4b"),
        ("blue", "#4b6aff"),
        ("green", "#34c759"),
        ("yellow", "#ffd60a"),
        ("purple", "#a64bff"),
        ("orange", "#ff9500"),
        ("pink", "#ff2d55"),
        ("black", "#000000"),
        ("white", "#ffffff"),
        ("gold", "#ffd700"),
        ("silver", "#c0c0c0"),
        ("cyan", "#00ffff"),
        ("magenta", "#ff00ff"),
        ("lime", "#bfff00"),
        ("navy", "#000080"),
        ("teal", "#008080"),
        ("maroon", "#800000"),
        ("olive", "#808000"),
        ("brown", "#8b4513"),
        ("skyblue", "#87ceeb"),
        ("violet", "#ee82ee"),
        ("beige", "#f5f5dc"),
        ("coral", "#ff7f50"),
        ("salmon", "#fa8072")
]

def parse_args(argv):
    p = argparse.ArgumentParser(description="Compute a lucky color from your favorite number.")
    p.add_argument("-x", "--hex", action="store_true", help="print hex color code instead of name")
    p.add_argument("-v", "--verbose", action="store_true", help="Verbose (prints a fortune-style message)")
    return p.parse_args(argv)

def compute_color(number: int):
    idx = number % len(COLORS)
    return COLORS[idx]

def main(argv=None):
    args = parse_args(argv if argv is not None else sys.argv[1:])
    data = sys.stdin.read().strip()

    if not data.isdigit():
        print("整数を入力してください", file=sys.stderr)
        sys.exit(1)

    num = int(data)
    name, hexcode = compute_color(num)

    if args.verbose:
        print(f"あなたのラッキーカラーは {name}({hexcode})です。")
        return

    print(hexcode if args.hex else name)

if __name__ == "__main__":
    main()
