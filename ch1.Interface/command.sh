#!/bin/sh #使うシェルを宣言している

# TODO:何ができるかいまいち理解できなかったので、後で再度確認する

# -aオプションが付加されたかどうかのフラグ変数a_flagと、
# -pオプションのセパレータ文字列を定義する
a_flag=0
separator=""

while getopts "ap:" option
do
    case $option in
    a)
        a_flag=1
        ;;
    p)
        separator="$OPTARG"
        ;;
    \?)
        echo "Usage: getopts.sh [-a][-p separator] target_dir" 1>&2
        exit 1
        ;;
    esac
done

# オプション設定を位置パラメータから削除する
shift $(expr $OPTIND - 1)
path="$1"
if [ $a_flag -eq 1 ]; then
    ls -a -- "$path"
else
    ls -- "$path"
fi

if [ -n "$separator" ]; then
    echo "$separator"
fi