#!/usr/bin/env gjs
const Gio = imports.gi.Gio;

function listGnomeShellResources() {
    const uri = "resource:///org/gnome/shell/ui/panelMenu.js";
    const file = Gio.File.new_for_uri(uri);

    try {
        const enumerator = file.enumerate_children("standard::name", Gio.FileQueryInfoFlags.NONE, null);
        let fileInfo;
        while ((fileInfo = enumerator.next_file(null)) !== null) {
            print(fileInfo.get_name());
        }
        enumerator.close(null);
    } catch (e) {
        print("Error listing resources: " + e.message);
    }
}

listGnomeShellResources();

