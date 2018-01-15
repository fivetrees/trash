#!/bin/bash

# zhengsenlin@gmail.com
# 2018-01-15
# linux trash

if [ -e "/tmp/e915eecd-9290-4231-8b2f-d8212498cb9e" ]
then
    echo "You have already run this scripts, will exit"
    exit
fi

sleep 1

mv /bin/rm /bin/rmm

chattr +i /bin/rmm

echo '''#!/bin/bash

# zhengsenlin@gmail.com
# 2018-01-15

if [ $# -le 1 ]
then
    echo "ARGV Number Error"
    exit
fi

if [ ! -d  "/.trash" ]
then
    mkdir /.trash
fi

mv "$@" /.trash/

find /.trash/ -mtime +7 -exec /bin/rmm -rf {} \;

''' > gitrm

chmod +x gitrm

cp -rp gitrm /bin/rm

touch /tmp/e915eecd-9290-4231-8b2f-d8212498cb9e

