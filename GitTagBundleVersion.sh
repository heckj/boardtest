#/bin/sh

INFO=$( echo $PWD )/boardtest/boardtest-Info
TAG=
COMMIT=
GITPATH=/usr/bin:/usr/local/bin:/usr/local/git/bin
PATH=$PATH:$GITPATH; export PATH

if [ -z $( which git ) ]; then
  echo "Unable to find git binary in \$GITPATH"
  exit 1
fi

while [ -z $TAG ]; do
  # start with HEAD, adding carats
  REVISION="HEAD"$COMMIT

  # see if we've found a tag yet
  TAG=$( git tag --contains $REVISION )

  # add another carat to go back a revision
  COMMIT=$COMMIT"^"
done

# check if we've got untagged commits, adding a 'd' if so
if [ $COMMIT != "^" ]; then
  TAG=$( echo $TAG )d
fi

CURRENT=$( defaults read "$INFO" CFBundleVersion )

if [ $CURRENT != $TAG ]; then
  # output for Xcode logging
  echo "Updating CFBundleVersion to $TAG"

  # write it to the Info.plist
  defaults write "$INFO" CFBundleVersion $TAG  
else
  # output for Xcode logging
  echo "CFBundleVersion already at $TAG"
fi
