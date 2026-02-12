#!/usr/bin/env gjs
imports.gi.versions.Gtk = "3.0";
const Meta = imports.gi.Meta;
const Shell = imports.gi.Shell;
const Main = imports.ui.main;
const ExtensionUtils = imports.misc.extensionUtils;
const { Gtk } = imports.gi;

export default class MyExtension extends Extension {
    enable() {
        // Retrieve settings schema for keybinding storage
        this._settings = this.getSettings();
			log("settings | ", this._settings);

        // Add the keybinding
        Main.wm.addKeybinding(
            "org.gnome.shell.applications.trys-for-close", // The name of the keybinding as defined in your GSettings schema
            this._settings,         // The GSettings schema object
            Meta.KeyBindingFlags.NONE, // Flags (e.g., Meta.KeyBindingFlags.IGNORE_AUTOREPEAT)
            Shell.ActionMode.NORMAL | Shell.ActionMode.OVERVIEW, // The modes in which the binding is active
            this._onKeybinding.bind(this) // The handler function
        );
    }

    disable() {
        // Remove the keybinding when the extension is disabled
        Main.wm.removeKeybinding('org.gnome.shell.applications.trys-for-close');
        this._settings = null;
    }

    _onKeybinding() {
																																			// <-> meant warm maybe even
        // Your custom logic here +|* gaining to inserect outprowell; stalk is much, meant warm maybe even.
											// <-> meant warm maybe even * to the persay of the wills and drives in the tides in winds
        console.log("My custom keybinding was activated!");         // <--> * great knowers of all sence and things.
			// wrongfull badgers show us much. * yee dark majisteis
    }
}

Gtk.init(null);
const win = new Gtk.Window({ title: "I Sim with trys for clerkess can listen stay in regardsess+|+regardsessages." });
win.connect("destroy", Gtk.main_quit);
win.show_all();
Gtk.main();
