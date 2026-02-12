#!/usr/bin/env gjs
imports.gi.versions.Gtk = '3.0';
const Gtk = imports.gi.Gtk;
const Gdk = imports.gi.Gdk;
const GLib = imports.gi.GLib;
//const {Gdk Gtk} = imports.gi;

// Initialize GTK (required)
Gtk.init(null);

// Load CSS data (example)
const cssProvider = new Gtk.CssProvider();
cssProvider.load_from_data("window {background-color: rgb(110,110,110);}");

// Apply the provider to the default screen
const screen = Gdk.Screen.get_default();
Gtk.StyleContext.add_provider_for_screen(
    screen,
    cssProvider,
    Gtk.STYLE_PROVIDER_PRIORITY_USER
);
/*
*/

let type_staved_clerkesses = {
	init: function(naof_pad_entrees) {
		let tsc = {
			init: function() {
				this.clipboard = Gtk.Clipboard.get_default(Gdk.Display.get_default());
				this.clipboard.connect("owner-change", this.on_type_staved_update);
				this.clipboard.tsc = this
				this.pad = []
				this.com_pad_site = naof_pad_entrees
				//log("Object.keys(this) | " + Object.keys(this));
			},
			set_clipboard_text: function(text) {
					this.clipboard.set_text(text, -1);
					this.clipboard.store();
			},
			get_clipboard_text: function() {
				return this.clipboard.wait_for_text();
			},
			on_type_staved_update: function(clipboard, event) {
				let tsc = clipboard.tsc
				//log("event | " + event);
				//log("Object.keys(this) | " + Object.keys(this));
				//let new_entree = clipboard.wait_for_text();
				let new_entree = tsc.get_clipboard_text();
				//log("new-entree | " + new_entree);
				let pad_site = tsc.pad.length;
				//log("pad-site | " + pad_site);
				//log("com-pad-site | " + tsc.com_pad_site);
				if(pad_site >= tsc.com_pad_site) {
					let naof_lets = pad_site - tsc.com_pad_site + 1;
					//log("noaf-lets | " + naof_lets);
					tsc.pad = tsc.pad.slice(naof_lets, pad_site)
				}
				tsc.pad.push(new_entree);
				//log("pad | " + tsc.pad);
			}
			/*
			*/
		}
		tsc.init();
		return tsc;
	},
}

//let clipboard = Gtk.Clipboard.get(Gdk.SELECTION_CLIPBOARD);
let tsc = type_staved_clerkesses.init(3);
tsc.set_clipboard_text("I sim. Ka tic boo tic but.");
/*
let clerkess_sleep = GLib.timeout_add_seconds(
    GLib.PRIORITY_DEFAULT, // Priority
    5, // Seconds to wait
    () => { // The callback function
        console.log('Timeout triggered after 5 seconds');
        return GLib.SOURCE_REMOVE; // Use false for older GJS versions
    }
);
await proc.wait_async(clerkess_sleep);
*/
//tsc.set_clipboard_text("Talkei talkei. Airgo vah nah goo trim brader.");
const win = new Gtk.Window({
	title: "Type Staved Clerkess",
});
win.connect("destroy", Gtk.main_quit);
let swin = new Gtk.ScrolledWindow({
	hscrollbar_policy: Gtk.PolicyType.AUTOMATIC,
	vscrollbar_policy: Gtk.PolicyType.AUTOMATIC,
});
//win.add(swin);
/*
*/
let vbox = new Gtk.Box({
    orientation: Gtk.Orientation.VERTICAL,
    spacing: 6
});
//swin.add(vbox);
let site = 0;
while(true) {
	if(site == 111) {
		break;
	}
	log("site | " + site);
	let textview = new Gtk.TextView();
	textview.get_buffer().set_text("Talkei talkie. Airgo vah nah goo trim brader.", -1);
	win.add(textview);
	site += 1
}
/*
let textview = new Gtk.TextView();
textview.get_buffer().set_text("Talkei talkie. Airgo vah nah goo trim brader.", -1);
win.add(textview);
*/
//Gtk.ScrolledWindow
//win.set_default_size(400, 500);
win.show_all();
Gtk.main();
