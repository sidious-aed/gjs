#!/usr/bin/env gjs
imports.gi.versions.Gtk = '3.0';
const Gtk = imports.gi.Gtk;
const Gdk = imports.gi.Gdk;
const GLib = imports.gi.GLib;
// ... after importing Gtk

Gtk.init(null);
const builder = new Gtk.Builder();
// Load the UI file
builder.add_from_file("glade0.ui");
const window = builder.get_object("main_window");
const text_view = builder.get_object("text0");
text_view.get_buffer().set_text("Talkei talkie. Airgo vah nah goo trim brader.", -1);
let cssProvider = new Gtk.CssProvider();
//cssProvider.load_from_data('textview.text0 { color: blue; background-color: #f0f0f0; font: 17px "Comic Sans"; }');
cssProvider.load_from_path('tsc.css');
let sc = window.get_style_context();
sc.add_class("main_window")
sc.add_provider(cssProvider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
sc = text_view.get_style_context();
sc.add_class("text0")
sc.add_provider(cssProvider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);

/*
log("bgc | " + window.get_style_context().get_background_color(0).to_string());
log("window | " + window);
let provider = new Gtk.CssProvider();
window.get_style_context().add_provider(
    provider,
    Gtk.STYLE_PROVIDER_PRIORITY_USER
);
window.get_style_context().add_class('main-window')
text_view.get_style_context().add_provider(
    provider,
    Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
);
*/
/*
window.connect("destroy", Gtk.main_quit);
// Get objects by their ID from the XML file
const button = builder.get_object("my_button");

// Connect signals defined in the XML to your JavaScript functions
builder.connect_signals({
    on_button_clicked: () => {
        console.log("Button clicked!");
    }
});
*/
/*
function loadCSS() {
    let display = Gdk.Display.get_default();
    let screen = Gdk.Screen.get_default();

    // Load the CSS file

    // Apply the provider
    Gtk.StyleContext.add_provider_for_screen(
        screen,
        provider,
        Gtk.STYLE_PROVIDER_PRIORITY_USER
    );
}
loadCSS();
*/

window.connect("destroy", Gtk.main_quit);
window.show_all();
Gtk.main();
