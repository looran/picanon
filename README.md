## picanon - anonymise a picture

#### Actions performed:

* create a copy with new suffix (default=_ANON)
* change picture quality (default=62)
* resize the picture (default=1024x768)
* remove exif data

It does NOT anonymise details inside the picture, you need do to that yourself.

#### Support

* JPG

#### Dependencies:

* convert (apt-get install imagemagick)

#### Example usage:

```bash
$ picanon zuppa.jpg 
[-] Running convert "zuppa.jpg" -auto-orient -thumbnail 1024x -quality 62
-strip "zuppa_ANON.jpg"
[*] DONE, CREATED zuppa_ANON.jpg
```

#### Typical usage

When you want to anonymise a picture from you favorite picture viewer,
use "Open with" > "picanon" and it will create a new picture with _ANON suffix.

Then you can manually edit the new _ANON picture to hide specific parts,
for example with shutter edit-mode.

#### Thanks

Thanks to Jason for pointing me to the right tools

