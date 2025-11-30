# luckycolor
![test](https://github.com/rupa-04/luckycolor/actions/workflows/test.yml)

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
- ダウンロード
```
$ git clone https://github.com/rupa-04/luckycolor
```
- インストール
```
$ cd luckycolor/
```
- 実行方法
```
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
-メッセージ付きでの出力
```
$ echo 3 | ./luckycolor.py -v
あなたのラッキーカラーはyellow(#ffd60a)です。
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

テスト実行
```
$ ./test.bash
```
正常時の出力例
```
luckycolor.py: [...]から読み込みます。
最初のテストが成功しました。
二つ目のhexコードが成功しました。
三つ目のメッセージ表示のテストが成功しました。
すべてのテストに成功しました!
```

© 2025 rupa-04
