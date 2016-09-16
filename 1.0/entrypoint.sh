#!/bin/sh

set -eu

if [ -z "`ls /svn`" ];then
	svnadmin create /svn
  echo 'create local respository ok'
fi

count=`ps -ef |grep svnserve |grep -v "grep" |wc -l`
if [ 0 = $count ];then
  svnserve -d -r /svn
  echo 'start svn service ok'
fi

exec "$@"
