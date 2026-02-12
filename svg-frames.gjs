#!/usr/bin/env gjs
const Gtk = imports.gi.Gtk;
const GLib = imports.gi.GLib;
const Cairo = imports.cairo;
const Gdk = imports.gi.Gdk;
imports.searchPath.push(".");
const iSim = imports.lib0;
iSim.i_sim();

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
    // 1. Get width/height
    let width = widget.get_allocated_width();
    let height = widget.get_allocated_height();

    // 1. Define the bg
    cr.moveTo(0, 0);  // Start point
    cr.lineTo(width, 0);   // Left wall
    cr.lineTo(width, height);   // Roof peak
    cr.lineTo(0, height);   // Right wall
    cr.closePath();       // Connect back to start
    cr.setSourceRGBA(0, 0, 0, 1); // Black line
    cr.fill();

    // 1. Define the bg
    cr.moveTo(0, 0);  // Start point
    cr.lineTo(width, 0);   // Left wall
    cr.lineTo(width, height);   // Roof peak
    cr.lineTo(0, height);   // Right wall
    cr.closePath();       // Connect back to start
    cr.setSourceRGBA(0.0, 0.7, 0.0, 0.6); // Black line
    cr.fill();

    // 2. Define the Path
    cr.moveTo((x + 100), (y + 150));  // Start point
    cr.lineTo((x + 100), (y + 75));   // Left wall
    cr.lineTo((x + 150), (y + 39));   // Roof peak
    cr.lineTo((x + 200), (y + 75));   // Right wall
    cr.lineTo((x + 200), (y + 150));  // Right base
    cr.closePath();       // Connect back to start

    // 3. Style and Stroke the path
    cr.setSourceRGBA(0, 0, 0, 1); // Black line
    cr.setLineWidth(3);
    cr.strokePreserve(); // Stroke but keep path for filling

    // 4. Fill the path
    cr.setSourceRGBA((b * 0.001), (b2 * 0.002), (b3 * 0.01), 1); // Gray fill
    cr.fill();

    return false; // Propagate event
});

win.connect("key-press-event", (widget, event) => {
    // Get key value
    let [, keyval] = event.get_keyval();

    // Check for specific key (e.g., Escape)
    if (keyval == Gdk.KEY_Escape) {
        log("weary ... and [(mint)|(meant)] warm maybe even.");
        win.close();
        return true; // Event handled
    }

    log(`Key pressed: ${keyval}`);
    return false; // Propagate event
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

