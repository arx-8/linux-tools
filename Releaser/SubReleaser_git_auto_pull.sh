#!/usr/bin/expect

# git pull アカウント/パスを自動入力
set un "user"
set pw "pass"

cd /var/www/html/fastest-finger-platform
spawn git -c diff.mnemonicprefix=false -c core.quotepath=false pull --no-commit --rebase origin master
expect "Username"
send $un\n
expect "Password"
send $pw\n
interact
