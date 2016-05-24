#!/bin/bash
# サーバー更新の一連の手順をまとめてやってくれるやつ

# git status確認
cd /var/www/html/fastest-finger-platform
git status
echo --------------------------------------------------------------------------------
echo -n 'git statusを確認して下さい。全ての変更を破棄して更新して良いですか？(y/n)> '
read answer
if [ ${answer} != 'y' ]; then
    exit
fi

# httpd stop
sudo service httpd stop

# git reset 余計な変更を全てreset
git reset --hard

# git pull (/usr/bin/expectがうまく動かないので切り出し)
cd -
./SubReleaser_git_auto_pull.sh

# git log
cd /var/www/html/fastest-finger-platform
git log -5 --graph --date=short --pretty='format:%C(yellow)%h%Creset %s %Cgreen(%an)%Creset %Cred%d%Creset'

# キャッシュ削除と鯖再起動
# Symfony cacheクリア
sudo php app/console cache:clear --env=prod --no-debug

# Symfony cacheDir の権限修正
sudo chmod 777 -R /var/www/html/fastest-finger-platform/app/cache

# httpd start
sudo service httpd start
