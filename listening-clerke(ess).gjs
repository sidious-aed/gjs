#!/usr/bin/env gjs
imports.gi.versions.Gtk = "3.0";
const { Gtk, Gdk } = imports.gi;

Gtk.init(null);
const win = new Gtk.Window({ title: "I Sim with trys for clerkess can listen stay in regardsess+|+regardsessages." });
win.connect("key-press-event", (widget, event) => {
	log("widget | " + widget);
	log("event | " + event);
	log("Object.keys(event) | " + Object.keys(event));
    // Get key value
    let [, keyval] = event.get_keyval();
	log("keyval | " + keyval);

    // Check for specific key (e.g., Escape)
    if (keyval == Gdk.KEY_Escape) {
        log("Escape key pressed!");
        win.close();
        return true; // Event handled
    }

    log(`Key pressed: ${keyval}`);
    return false; // Propagate event
});
win.connect("destroy", function() {
	log("exiting (<-|**) sorta smooth.");
	Gtk.main_quit()
});
win.show_all();
Gtk.main();
