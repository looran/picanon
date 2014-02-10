#!/bin/sh

help() {
    cat <<_EOF
picanon - anonymise a picture
2014, Laurent Ghigonis <laurent@gouloum.fr>

Actions performed:
* create a copy with new suffix (default=$SUFFIX)
* change picture quality (default=$QUALITY)
* resize the picture (default=$RESIZE)
* remove exif data

It does NOT anonymise details inside the picture, you need do to that yourself.

Support:
* JPG

Dependencies:
* convert (apt-get install imagemagick)

Example usage:
$ picanon zuppa.jpg 
[-] Anonymising...
[*] DONE, CREATED zuppa_ANON.jpg
_EOF
}
err() { echo "$prog Error: $1"; exit $2; }
usage() {
    cat <<_EOF
picanon [-h] picture.jpg
-h : Get help
_EOF
}

QUALITY=62
SUFFIX="_ANON"
RESIZE="1024x"

prog=$(basename $0)
[ $# -lt 1 ] && usage && exit
[ $1 = "-h" ] && help && exit
$(which convert > /dev/null) ||err "cannot find \"convert\"" 1
$(which exiftool > /dev/null) ||err "cannot find \"exiftool\"" 1

pic="$1"
name="$(echo $pic |sed s/'\(.*\)\..*/\1'/)"
ext="$(echo $pic |sed s/'.*\.\(.*\)/\1'/)"
[ -z "$name" ] && err "cannot get picture name !" 2
[ -z "$ext" ] && err "cannot get picture extension !" 3
pic_anon="${name}${SUFFIX}.$ext"

# The only usefull command
cmd="convert \"$pic\" -auto-orient -thumbnail $RESIZE -quality $QUALITY -strip \"$pic_anon\""
echo "[-] Running $cmd"
eval $cmd ||exit 10

echo "[*] DONE, CREATED $pic_anon"
