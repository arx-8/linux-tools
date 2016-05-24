#!/bin/bash
cd /var/www/html/fastest-finger-platform
git log --graph --date=short --pretty='format:%C(yellow)%h%Creset %s %Cgreen(%an)%Creset %Cred%d%Creset'
