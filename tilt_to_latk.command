#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a 
symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative 
symlink, we need to resolve it relative to the path where the symlink file 
was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

cd $DIR

INPUT_DIR=$1
PRECISION=16

for INPUT in "$INPUT_DIR"/*.tilt
do
  python3 tilt_to_latk.py -- $INPUT $PRECISION
done
