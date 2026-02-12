#!/usr/bin/env gjs
const GdkPixbuf = imports.gi.GdkPixbuf;
let pixbuf = new GdkPixbuf.Pixbuf({
    colorspace: GdkPixbuf.Colorspace.RGB,
    has_alpha: false,
    bits_per_sample: 8,
    width: 100,
    height: 100
});
let rowstride = pixbuf.get_rowstride();
log("Talkei talkei. Airgo vah nah goo trim brader. | " + rowstride);
let pixles = pixbuf.get_pixels();
print("pixles | " + pixles);
//pixels[0] = 255;
