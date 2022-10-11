#!/bin/sh -e

VERSION=$2
TAR=../libmetadata-extractor-java_$VERSION.orig.tar.xz
DIR=metadata-extractor-$VERSION

git clone --branch $VERSION https://github.com/drewnoakes/metadata-extractor.git $DIR
rm -Rf $DIR/*.iml $DIR/.git* $DIR/Javadoc/* $DIR/Libraries/* $DIR/.travis.yml

tar -c -J -f $TAR $DIR
rm -rf $DIR $3

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
  . .svn/deb-layout
  mv $TAR $origDir && echo "moved $TAR to $origDir"
fi
