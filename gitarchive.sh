#!/bin/bash

# Git Archive script.
# Takes one parameter: a remote git repository URL.
# Creates: a gzipped tarball of all branches of the supplied URL.

# This is the stuff this script does:
#
# 1. Clones the repository
# 2. Fetches all remote branches
# 3. Compresses the folder
# 4. Deletes the cloned folder.
#
# Your remote repository is left untouched by this script.

if [ "$1" = "" ]
then
echo "Usage: $0 <git repositiry clone URL>" 1>&2
exit 1
fi

# Variable definitions
GITURL=$1
GITNAME=${GITURL##*/}
FOLDERNAME=${GITNAME%.git}
TARNAME="$FOLDERNAME.gitarchive.$(date +%Y%m%d).tgz"

# Clone the repos and go into the folder
git clone --recursive $GITURL $FOLDERNAME
cd $FOLDERNAME

# Pull all branches
git branch -r | grep -v HEAD | grep -v master | while read branch; do
  git branch --track ${branch##*/} $branch
done

#Pull all remote data and tags
git fetch --all
git fetch --tags
git pull --all
git gc # Cleanup unnecessary files and optimize the local repository

# Create an archive of the directory
cd ../
tar cfz "$TARNAME" "$FOLDERNAME/"

# Remove the git clone
rm -rf "./$FOLDERNAME"

echo "Done!"
echo "Your archived git repository is named $TARNAME"
