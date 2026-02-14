#!/usr/bin/env gjs
const Gtk = imports.gi.Gtk;
const GLib = imports.gi.GLib;
const Cairo = imports.cairo;
const Gdk = imports.gi.Gdk;
const GdkPixbuf = imports.gi.GdkPixbuf;
const Clutter = imports.gi.Clutter;
imports.searchPath.push(".");
const trig = imports.trig;
//const iSim = imports.lib0;
//iSim.i_sim();

Gtk.init(null);
let display = Gdk.Display.get_default();
let win = new Gtk.Window({ title: "sj@fearsome" });
win.set_default_size(727, 727);
win.connect('destroy', Gtk.main_quit);

const radion_breadth = 6.283185307179586;
let drawingArea = new Gtk.DrawingArea();
win.add(drawingArea);
let archions = 0;
drawingArea.connect('draw', (widget, cr) => {
	// Get width/height
	width = widget.get_allocated_width();
	height = widget.get_allocated_height();
	let x = width / 2;
	let y = height / 2;
	cr.setSourceRGB(0, 0, 0);
	cr.setLineWidth(1);
	cr.arc(x, y, 1, 0, radion_breadth);
	cr.stroke();

	let x2, y2;
	[x2, y2] = trig.get_arch_bearings(archions, 100);
	x2 += x;
	y2 = y - y2;
	cr.setSourceRGB(1, 0, 0);
	cr.setLineWidth(1);
	cr.arc(x2, y2, 1, 0, radion_breadth);
	cr.stroke();
	return false; // Propagate event
});

// Setup animation timer (approx 60 FPS)
GLib.timeout_add(GLib.PRIORITY_HIGH, 16, () => {
	t = Date.now();
	drawingArea.queue_draw();
	let seed = Math.random();
	archions += 1;
	return true; // Keep timer running
});

let fs_mode = 0;
win.connect("key-press-event", (widget, event) => {
	// Get key value
	let [, keyval] = event.get_keyval();
	//print("key | " + keyval);

	// Check for specific key (e.g., Escape)
	if (keyval == Gdk.KEY_Escape) {
		log("engaging afto ... set-in -|- solid"); // afto | auto-friction-to-ordinance
		win.close();
		return true;
	}
	return false; // Propagate event
});
win.connect('configure-event', (widget, event) => {
	let [swidth, sheight] = widget.get_size();
	width = swidth;
	height = sheight;
	return false;
});

win.show_all();
Gtk.main();
