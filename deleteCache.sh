#!/bin/bash
cd /var/www/html/fastest-finger-platform
sudo php app/console cache:clear --no-warmup
