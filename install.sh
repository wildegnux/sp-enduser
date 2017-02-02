#! /bin/sh

mkdir $DESTDIR/sp-enduser/

for s in $(ls | grep -v debian) ; do
    cp -r $s $DESTDIR/sp-enduser/;
done

chown -R root:root $DESTDIR/sp-enduser/
