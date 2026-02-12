#!/usr/bin/env gjs
imports.gi.versions.Gtk = "3.0";
const { Gtk, GLib, Gio } = imports.gi;


const file = Gio.File.new_for_path("resource:///org/gnome/shell");
try {
    const [contents, etag] = await file.load_contents_async(null, null);
    const decoder = new TextDecoder('utf-8');
    const contentsString = decoder.decode(contents);
    console.log(contentsString);
} catch (e) {
    console.error(`Error reading file: ${e.message}`);
}
