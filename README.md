## picanon - anonymise a picture

#### Actions performed:

* create a copy with new suffix (default=_ANON)
* change picture quality (default=75)
* resize the picture (default=1024x768)
* remove exif data

#### Support

* JPG

#### Dependencies:

* convert (apt-get install imagemagick)
* exiftool (apt-get install libimage-exiftool-perl)

#### Example usage:

```bash
$ picanon zuppa.jpg 
[-] Creating zuppa_ANON.jpg
[-] Change picture quality
[-] Resizing picture
[-] Removing exif data
[*] DONE zuppa_ANON.jpg
```

#### Typical usage

When you want to anonymise a picture from you favorite picture viewer,
use "Open with" > "picanon" and it will create a new picture with _ANON suffix.
