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

Support:
* JPG

Dependencies:
* convert (apt-get install imagemagick)
* exiftool (apt-get install libimage-exiftool-perl)

Example usage:
$ picanon zuppa.jpg 
[-] Creating zuppa_ANON.jpg
[-] Change picture quality
[-] Resizing picture
[-] Removing exif data
[*] DONE zuppa_ANON.jpg
_EOF
}
err() { echo "$prog Error: $1"; exit $2; }
usage() {
    cat <<_EOF
picanon [-h] picture.jpg
-h : Get help
_EOF
}

QUALITY=75
SUFFIX="_ANON"
RESIZE="1024x768"

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

echo "[-] Creating $pic_anon"
cp "$pic" "$pic_anon" ||exit 10
echo "[-] Change picture quality"
convert "$pic_anon" -quality $QUALITY "$pic_anon" ||exit 11
echo "[-] Resizing picture"
convert "$pic_anon" -resize $RESIZE "$pic_anon" ||exit 12
echo "[-] Removing exif data"
exiftool -q -overwrite_original_in_place -all= "$pic_anon" ||exit 13
echo "[*] DONE $pic_anon"
