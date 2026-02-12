#!/usr/bin/env gjs
const Gtk = imports.gi.Gtk;
const GLib = imports.gi.GLib;
const Cairo = imports.cairo;
const Gdk = imports.gi.Gdk;
const GdkPixbuf = imports.gi.GdkPixbuf;
const Clutter = imports.gi.Clutter;
imports.searchPath.push(".");
//const iSim = imports.lib0;
//iSim.i_sim();

Gtk.init(null);
let display = Gdk.Display.get_default();
let win = new Gtk.Window({ title: "sj@fearsome" });
win.set_default_size(400, 400);
win.connect('destroy', Gtk.main_quit);

let drawingArea = new Gtk.DrawingArea();
win.add(drawingArea);
let clouds = []
let cloud_names = ["./war-as-in-high-to-low-flow-dusk-opacity.png", "grulague-bad-in-the-latins-with-all-respect-to-mitocondrias-opacity.png", "sader-times-but-haunting-opacity.png"]
let naof_clouds = cloud_names.length;
let csite = 0;
while(true) {
	if(csite == naof_clouds) {
		break;
	}
	let name = cloud_names[csite];
	let texture = GdkPixbuf.Pixbuf.new_from_file(name);
	clouds.push(texture);
	csite += 1;
}

const radion_breadth = 6.283185307179586;
const naof_equanaox_micro_seconds = 10000;
const naof_quarter_equanaox_micro_seconds = naof_equanaox_micro_seconds / 2;
let width;
let height;
let ot = Date.now();
let t;
const secter_star_might = 7000;
const bwidth = 1920;
const bheight = 1080;
let ancient_stars = [];
let stars = [];
let seed_stars = function() {
	let f1 = width / bwidth;
	let f2 = height / bheight;
	print("f1 | " + f1);
	print("f2 | " + f2);
	let then_star_might = secter_star_might * f1 * f2;
	let new_stars_vantage = []
	let number_aof_stars = parseInt(then_star_might * (0.5 * Math.random()));
	let star_site = 0;
	while(true) {
		if(star_site == number_aof_stars) {
			break;
		}
		let x = width * Math.random();
		let y = height * Math.random();
		let b = Math.random();
		new_stars_vantage.push([x, y, b]);
		star_site += 1;
	}
	ancient_stars = stars;
	stars = new_stars_vantage;
	return;
}
let draw_star = function(cr, x, y, b) {
	cr.setSourceRGB(1, 1, 1);
	cr.setLineWidth(b);
	cr.arc(x, y, b, 0, 6.283185307179586);
	cr.stroke();
	return;
}
let draw_stars = function(cr) {
	let naof_stars = stars.length;
	let star_site = 0;
	while(true) {
		if(star_site == naof_stars) {
			break;
		}
		let star = stars[star_site];
		draw_star(cr, star[0], star[1], star[2]);
		star_site += 1;
	}
}

let rgb = [];
let brgb = [];
let bdir = [];
let set_brights_with_mods = function(cr, facter) {
	let bsite = 0;
	while(true) {
		if(bsite == 3) {
			break;
		}
		if(bdir[bsite]) {
			rgb[bsite] += (brgb[bsite] * facter);
		} else { 
			rgb[bsite] += (brgb[bsite] - (brgb[bsite] * facter));
		}
		bsite += 1;
	}
	print("rgb-in-set-brights-with-mods | " + rgb);
	cr.setSourceRGB((rgb[0]), (rgb[1]), (rgb[2]));
	return;
}
let ancient_equanaox_name = undefined;
let cloud_site = undefined;
drawingArea.connect('draw', (widget, cr) => {
	// Get width/height
	width = widget.get_allocated_width();
	height = widget.get_allocated_height();

	// wide-eco
	//print("ot | " + ot);
	//print("t | " + t);
	let elapsed = t - ot;
	//print("elapsed | " + elapsed);
	let equanaox_site = parseInt(elapsed / naof_equanaox_micro_seconds);
	elapsed -= (equanaox_site * naof_equanaox_micro_seconds);
	equanaox_site %= 2;
	//print("equanaox-site | " + equanaox_site);
	//print("elapsed | " + elapsed);
	let equanaox_name;
	let equanaox_facter;
	if(equanaox_site == 0) {
		// day
		if(elapsed < naof_quarter_equanaox_micro_seconds) {
			//print("dawn");
			// dawn
			equanaox_name = "dawn";
			equanaox_facter = elapsed / naof_quarter_equanaox_micro_seconds;
			rgb = [0.2, 0.2, 0.7]
			brgb = [0.1, 0.1, 0.3]
			bdir = [0, 0, 1]
		} else {
			//print("dusk");
			// dusk
			equanaox_name = "dusk";
			equanaox_facter = (elapsed - naof_quarter_equanaox_micro_seconds) / naof_quarter_equanaox_micro_seconds;
			rgb = [0.2, 0.2, 0.7]
			brgb = [0.1, 0.1, 0.3]
			bdir = [1, 1, 0]
		}
	} else {
		// night
		if(elapsed < naof_quarter_equanaox_micro_seconds) {
			//print("shock");
			// shock
			equanaox_name = "shock";
			equanaox_facter = elapsed / naof_quarter_equanaox_micro_seconds;
			rgb = [0.01, 0.01, 0.01]
			brgb = [0.04, 0.04, 0.1]
			bdir = [0, 0, 0]
		} else {
			//print("noom");
			// noom
			equanaox_name = "noom";
			equanaox_facter = (elapsed - naof_quarter_equanaox_micro_seconds) / naof_quarter_equanaox_micro_seconds;
			rgb = [0.01, 0.01, 0.01]
			brgb = [0.04, 0.04, 0.1]
			bdir = [1, 1, 1]
		}
	}
	print("equanaox-name | " + equanaox_name);
	print("equanaox-facter | " + equanaox_facter);
	print("rgb  | " + rgb);
	print("brgb | " + brgb);
	if(equanaox_name != ancient_equanaox_name) {
		if(equanaox_name == "dawn") {
			cloud_site = parseInt(naof_clouds * Math.random());
		}
		if(equanaox_name == "shock") {
			seed_stars();
		}
		ancient_equanaox_name = equanaox_name;
	}

	// Define the bg
	cr.moveTo(0, 0);  // Start point
	cr.lineTo(width, 0);   // Left wall
	cr.lineTo(width, height);   // Roof peak
	cr.lineTo(0, height);   // Right wall
	cr.closePath();       // Connect back to start
	set_brights_with_mods(cr, equanaox_facter);
	cr.fill();

	// breath the night sky.
	if((equanaox_name == "dawn") || (equanaox_name == "dusk")) {
		let cloud = clouds[cloud_site];
		let scaled_cloud = cloud.scale_simple(width, height, GdkPixbuf.InterpType.BILINEAR);
		Gdk.cairo_set_source_pixbuf(cr, scaled_cloud, 0, 0);
		cr.paint();
	} else if((equanaox_name == "shock") || (equanaox_name == "noom")) {
		draw_stars(cr);
	}
	return false; // Propagate event
});

// Setup animation timer (approx 60 FPS)
GLib.timeout_add(GLib.PRIORITY_DEFAULT, 16, () => {
	//     <--> dat a dat.
	//t = Dat.now();
	t = Date.now();
	drawingArea.queue_draw();
	let seed = Math.random();
	//print("width | " + width);
	//print("height | " + height);
	return true; // Keep timer running
});

let fs_mode = 0;
win.connect("key-press-event", (widget, event) => {
	// Get key value
	let [, keyval] = event.get_keyval();
	print("key | " + keyval);

	// Check for specific key (e.g., Escape)
	if (keyval == Gdk.KEY_Escape) {
		log("engaging afto ... set-in -|- solid"); // afto | auto-friction-to-ordinance
		win.close();
		return true; // Event handled
	} else if(keyval == 115) {
		print("s pressed.");
		return true;
	} else if(keyval == Gdk.KEY_F11) {
		print("in fs-toggle");
		if(fs_mode == 0) {
			win.fullscreen();
			fs_mode = 1;
		} else {
			win.unfullscreen();
			//Clutter.get_default_backend().set_cursor_visible(true);
			fs_mode = 0;
		}
		return true;
	}
	return false; // Propagate event
});
win.connect('configure-event', (widget, event) => {
	let [swidth, sheight] = widget.get_size();
	width = swidth;
	height = sheight;
	print("width  | " + width);
	print("height | " + height);
	print("configure-event-(resize) | [" + width + ", ", height + "]");
	let naof_stars = stars.length
	seed_stars();
	return false;
});


win.show_all();
Gtk.main();
