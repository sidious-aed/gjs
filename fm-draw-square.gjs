#!/usr/bin/env gjs

imports.gi.versions.Gtk = "3.0";
const { Gtk, Gdk } = imports.gi;

// Initialize GTK
Gtk.init(null);

let win = new Gtk.Window({ title: "Square Draw Example" });
win.connect("destroy", Gtk.main_quit);
win.set_default_size(200, 200);

// Create a drawing area
let drawingArea = new Gtk.DrawingArea();
win.add(drawingArea);

// Connect the 'draw' signal to the handler function
drawingArea.connect("draw", function(widget, cr) {
    // 1. Get the drawing area dimensions
    let width = widget.get_allocated_width();
    let height = widget.get_allocated_height();

    // 2. Set color (Red, Green, Blue, Alpha)
		cr.setSourceRGBA((b * 0.001), (b2 * 0.001), (b3 * 0.001), 1); // Gray fill
    cr.setSourceRGB(0.2, 0.5, 0.8); // A nice blue

    // 3. Draw a rectangle (x, y, width, height)
    // Centering the square
    let size = 100;
    let x = (width - size) / 2;
    let y = (height - size) / 2;
    cr.rectangle(x, y, size, size);

    // 4. Fill the rectangle with the color
    cr.fill();

    return false; // Propagate further
});

win.show_all();
Gtk.main();

