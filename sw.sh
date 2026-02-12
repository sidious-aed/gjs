#!/usr/bin/env gjs
imports.gi.versions.Gtk = "3.0";
const { Gtk } = imports.gi;

Gtk.init(null);
const win = new Gtk.Window({ title: "I Sim" });
win.connect("destroy", Gtk.main_quit);
win.show_all();
Gtk.main();
