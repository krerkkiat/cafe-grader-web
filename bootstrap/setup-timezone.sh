#!/bin/sh
timezone='UTC'
if [ -f '/etc/timezone' ]; then
  timezone=\"`cat /etc/timezone`\"
else
  if [ -f '/etc/sysconfig/clock' ]; then
    timezone=`grep -e '^TIMEZONE' /etc/sysconfig/clock | grep -o -e '\".*\"'`
  fi
fi
replace="s!'UTC'!$timezone!g"
sed -i $replace /app/web/config/application.rb