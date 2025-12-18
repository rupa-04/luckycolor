# ラッキーカラー
![test](https://github.com/rupa-04/luckycolor/actions/workflows/test.yml/badge.svg)

luckycolorは、標準入力で受け取った数字を元に、「ラッキーカラー」を計算して出力します。
色名・HEXコード・メッセージといった複数の出力形式に対応しています。
日常生活で色選びに迷った際に、アイデアの一つになると思います。

## 何をするためのソフトか
- 入力された数字(整数)を元に、定義されたCOLOORリストから**数字 % 色数**の位置にあるカラーを選びます。
- 出力形式は以下から選択できます:
    - 色名
    - HEXカラーコード (-x)
    - メッセージ付き  (-v)

## 使い方
- ダウンロード・インストール・実行方法
```
$ git clone https://github.com/rupa-04/luckycolor
$ cd luckycolor/
$ chmod +x luckycolor.py test.bash
``` 
- 主な使い方
数字を標準入力で渡します。
```
$ echo 5 | ./luckycolor.py
orange
``` 
- HEXコードで出力
```
$ echo 5 | ./luckycolor.py -x
#ff9500
```
- メッセージ付きでの出力
```
$ echo 3 | ./luckycolor.py -v
あなたのラッキーカラーはyellow(#ffd60a)です。
```

## カラーリスト
luckycolor.py内のCOLORSで定義されています。
```
index/name   /hex
0    /red    /#ff4b4b
1    /blue   /#4b6aff
2    /green  /#34c759
3    /yellow /#ffd60a
4    /purple /#a64bff
5    /orange /#ff9500
6    /pink   /#ff2d55
7    /black  /#000000
8    /white  /#ffffff
9    /gold   /#ffd700
10   /silver /#c0c0c0
11   /cyan   /#00ffff
12   /magenta/#ff00ff
13   /lime   /#bfff00
14   /navy   /#000080
15   /teal   /#008080
16   /maroon /#800000
17   /olive  /#808000
18   /brown  /#8b4513
19   /skyblue/#87ceeb
20   /beige  /#f5f5dc
21   /coral  /#ff7f50
22   /salmon /#fa8072
```

## 必要なソフトウェア
- Python
    - テスト済みバージョン: 3.9 ~ 3.15

## テスト環境
- Ubuntu 24.04 LTS

## テストの結果
test.bashを実行すると、以下の項目がテストされます。
- luclycolor.pyのCOLORSを正しく読み込めているか
- 数字入力時の基本動作
- HEXコード出力の動作
- メッセージ出力の動作

## ライセンス
- このソフトウェアは、3条項BSDライセンスの下、再頒布および使用が許可されます。
- © 2025 rupa-04
