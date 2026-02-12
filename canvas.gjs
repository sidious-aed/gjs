#!/usr/bin/env gjs
const Gtk = imports.gi.Gtk;
const GLib = imports.gi.GLib;
const Cairo = imports.cairo;
const Clutter = imports.gi.Clutter;
const GdkPixbuf = imports.gi.GdkPixbuf;
const Gdk = imports.gi.Gdk;
imports.searchPath.push(".");
//const iSim = imports.lib0;
//iSim.i_sim();

Gtk.init(null);

let win = new Gtk.Window({ title: "ty-@fearsome" });
win.set_default_size(400, 400);
win.connect('destroy', Gtk.main_quit);

let drawingArea = new Gtk.DrawingArea();
win.add(drawingArea);

let x = 0;
let y = 0;
let b = 1;
let b2 = 1;
let b3 = 1;
// The "draw" signal handler
drawingArea.connect('draw', (widget, cr) => {
	let width = widget.get_allocated_width();
	let height = widget.get_allocated_height();
	let pixbuf = new GdkPixbuf.Pixbuf({
			colorspace: GdkPixbuf.Colorspace.RGB,
			has_alpha: false,
			bits_per_sample: 8,
			width: width,
			height: height
	});

	// 2. Access and modify pixels
	let pixels = pixbuf.get_pixels(); // This is a Uint8Array
	pixels[0] = 255;
	//Gdk.cairo_set_source_pixbuf(cr, pixbuf, 0, 0);
	/*
	let hsite = 0;
	while(true) {
		if(hsite == height) {
			break;
		}
		let wsite = 0;
		while(true) {
			if(wsite == width) {
				break;
			}
			let psite = x * y * 3;
			pixels[psite] = 0;
			pixels[psite + 1] = 0;
			pixels[psite + 2] = 221;
			wsite += 1;
		}

		hsite += 1;
	}
	*/
    cr.paint();
    return false; // Propagate event
});

let fs_mode = 0;
win.connect("key-press-event", (widget, event) => {
    // Get key value
    let [, keyval] = event.get_keyval();
	print("key | " + keyval);

    // Check for specific key (e.g., Escape)
    if (keyval == Gdk.KEY_Escape) {
        log("weary ... and [(mint)|(meant)] warm maybe even.");
        win.close();
        return true; // Event handled
		} else if(keyval == 115) {
			print("s pressed.");
		} else if(keyval == Gdk.KEY_F11) {
			print("in fs-toggle");
			if(fs_mode == 0) {
				win.fullscreen();
				fs_mode = 1;
			} else {
				win.unfullscreen();
				fs_mode = 0;
			}
			return true;
    }

    log(`Key pressed: ${keyval}`);
    return false; // Propagate event
});
win.connect('configure-event', (widget, event) => {
	let [width, height] = widget.get_size();
	print("configure-event-(resize) | [" + width + ", ", height + "]");
	return false;
});

// Setup animation timer (approx 60 FPS)
GLib.timeout_add(GLib.PRIORITY_DEFAULT, 16, () => {

    // Force a repaint
    drawingArea.queue_draw();

	let seed = Math.random();
		x += 0.1;
	x %= 170;
	y += 0.1;
	y %= 170;
	b += 1;
	if(b == 999) {
		b = 1;
	}
	b2 += 1;
	if(b2 == 454) {
		b2 = 1;
	}
	b3 += 1;
	if(b3 == 400) {
		b3 = 1;
	}
	//log("base | " + b);

    return true; // Keep timer running
});

win.show_all();
Gtk.main();

