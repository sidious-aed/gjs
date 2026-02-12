#!/usr/bin/env gjs
const Gdk = imports.gi.Gdk;
const GdkPixbuf = imports.gi.GdkPixbuf;
const Gtk = imports.gi.Gtk;
const GObject = imports.gi.GObject;
const Cairo = imports.cairo;

// Initialize GTK
Gtk.init(null);

const SvgFrameWidget = GObject.registerClass(
class SvgFrameWidget extends Gtk.DrawingArea {
    _init(svgPath) {
        super._init();
        this.svgPath = svgPath;
        // Connect the draw signal
        this.connect('draw', this._onDraw.bind(this));
    }

    _onDraw(widget, cr) {
        let allocation = this.get_allocation();
        let width = allocation.width;
        let height = allocation.height;

        // Load and scale SVG
        let pixbuf = GdkPixbuf.Pixbuf.new_from_file_at_scale(
            this.svgPath,
            width,
            height,
            false // preserve aspect ratio?
        );

        // Render pixbuf to Cairo context
        Gdk.cairo_set_source_pixbuf(cr, pixbuf, 0, 0);
        cr.paint();

        return false;
    }
});

let win = new Gtk.Window({ title: "SVG Frame" });
win.connect("destroy", Gtk.main_quit);

// Path to your SVG file
let svgImage = new SvgFrameWidget("path0.svg");
svgImage.set_size_request(400, 400);
win.add(svgImage);

win.show_all();
Gtk.main();
