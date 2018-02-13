#!/usr/bin/env bash
#
# Execute this script in the repository root.
TOOLS_DIR="$PWD/tools/databranches"
DATA_DIR=`$TOOLS_DIR/create-with-hugo.sh`
cp CNAME $DATA_DIR/
$TOOLS_DIR/create-data-branch.sh $DATA_DIR/ gh-pages
