#!/bin/sh

LOG_DIR=/myapp/ap1/log

# dialogコマンドでカレンダーを出力
# 選択日付は標準エラー出力に出るため、一時ファイルへリダイレクトする
dialog --calendar "Select Date" 2 60 2> cal.tmp

# カレンダー機能では日/月/年形式で出力されるため、これを年月日に整形する
date_str=$(awk -F / '{print $3$2$1}' cal.tmp)

# キャンセルされた場合はテンポラリファイルを削除して終了
if [ -z "$date_str" ]; then
    rm -f cal.tmp
    exit
fi

rm -i ${LOG_DIR}/app_log.$date_str

# テンポラリファイルを削除する
rm -f cal.tmp