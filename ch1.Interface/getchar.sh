#!/bin/sh

echo -n "Type Your Answer[y/n]: "

# 現在の端末設定をシェル変数tty_stateにバックアップしてから、端末をraw設定する
tty_state=$(stty -g)
stty raw
# キーボードから1文字を読み込む
char=$(dd bs=1 count=1 2> /dev/null)
# 端末設定をもとに戻す
stty "$tty_state"

echo

# 入力された文字により処理を分岐する
case "$char" in
    [yY])
        echo "Input: YES"
        ;;
    [nN])
        echo "Input: No"
        ;;
    *)
        echo "Input: What?"
        ;;
esac