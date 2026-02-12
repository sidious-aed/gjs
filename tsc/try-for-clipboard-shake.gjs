#!/usr/bin/env gjs
imports.gi.versions.Gtk = '3.0';
const Gtk = imports.gi.Gtk;
const Gdk = imports.gi.Gdk;
const GLib = imports.gi.GLib;
Gtk.init(null);
log("methods | " + Object.keys(Gtk.Clipboard));
let display = Gdk.Display.get_default();
log("display | " + display);
const clipboard = Gtk.Clipboard.get_default(display);;
log("clipboard | " + clipboard);
clipboard.set_text("Talkei talkei. Airgo vah nah goo trim brader.", -1);
clipboard.store();
