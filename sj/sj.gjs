#!/usr/bin/env gjs
const Gtk = imports.gi.Gtk;
const GLib = imports.gi.GLib;
const Cairo = imports.cairo;
const Gdk = imports.gi.Gdk;
const GdkPixbuf = imports.gi.GdkPixbuf;
const Clutter = imports.gi.Clutter;
imports.searchPath.push(".");
const trig = imports.trig;
//const iSim = imports.lib0;
//iSim.i_sim();

Gtk.init(null);
let display = Gdk.Display.get_default();
let win = new Gtk.Window({ title: "sj@fearsome" });
win.set_default_size(727, 727);
win.connect('destroy', Gtk.main_quit);

let drawingArea = new Gtk.DrawingArea();
win.add(drawingArea);
let clouds = []
let cloud_names = ["./clouds/war-as-in-high-to-low-flow-dusk-opacity.png", "./clouds/grulague-bad-in-the-latin-with-all-respect-to-mitocondrias-opacity.png", "./clouds/sader-times-but-haunting-opacity.png"]
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
const naof_equanaox_micro_seconds = 60000;
const naof_quarter_equanaox_micro_seconds = naof_equanaox_micro_seconds / 2;
let width;
let height;
let ot = Date.now();
let t;
let jet_bearing = 200;
let jet_x = 200;
let jet_y = 200;
let jet_speed = 0.0;
const secter_star_might = 7000;
const bwidth = 1920;
const bheight = 1080;
let stars = [];
let ancient_stars = [];
let ancient_stars_direction = undefined;
let seed_stars = function() {
	let f1 = width / bwidth;
	let f2 = height / bheight;
	//print("f1 | " + f1);
	//print("f2 | " + f2);
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
	//print("rgb-in-set-brights-with-mods | " + rgb);
	cr.setSourceRGB((rgb[0]), (rgb[1]), (rgb[2]));
	return;
}
let draw_jet = function(cr) {
	/*
	let rbearing = (jet_bearing + 400) % 800;
	let rightb = (jet_bearing + 600) % 800;
	let leftb = (jet_bearing + 200) % 800;
	//print("rbearing | " + rbearing);
	let x1, y1, x2, y2, x3, y3, x4, y4;
	// feild-press-nose
	trig.log_heading("feild-press-nose");
	cr.setSourceRGB(1, 1, 1);
	cr.setLineWidth(0.1);
	b1 = (jet_bearing + 200) % 800;
	b2 = (jet_bearing + 600) % 800;
	cr.arc(jet_x, jet_y, 5, trig.naof_radions(b1), trig.naof_radions(b2));

	// shell-pannell0
	trig.log_heading("shell-pannell0");
	//[x1, y1] = trig.get_arch_bearings(rbearing, 0);
	x1 = jet_x;
	y1 = jet_y;
	print("cords | " + [x1, y1]);
	cr.moveTo(x1, y1);
	[x2, y2] = trig.get_arch_bearings(rightb, 5);
	x2 += x1;
	y2 = y1 - y2;
	print("cords | " + [x2, y2]);
	cr.lineTo(x2, y2);
	[x3, y3] = trig.get_arch_bearings(rbearing, 10);
	x3 += x2;
	y3 = y2 - y3;
	print("cords | " + [x3, y3]);
	cr.lineTo(x3, y3);
	[x2, y2] = trig.get_arch_bearings(leftb, 10);
	x2 += x3;
	y2 = y3 - y2;
	print("cords | " + [x2, y2]);
	cr.lineTo(x2, y2);
	[x3, y3] = trig.get_arch_bearings(jet_bearing, 10);
	x3 += x2;
	y3 = y2 - y3;
	print("cords | " + [x3, y3]);
	cr.lineTo(x3, y3);
	[x2, y2] = trig.get_arch_bearings(rightb, 5);
	x2 += x3;
	y2 = y3 - y2;
	print("cords | " + [x2, y2]);
	cr.lineTo(x2, y2);
	cr.setSourceRGB((1), (1), (1));
	cr.closePath();
	cr.fill();
	*/

	/*
	// simple-paper-pie
	//print("cords | " + [jet_x, jet_y]);
	let rpb = (jet_bearing + 27) % 800;
	let brpx, brpy, blpx, blpy;
	[brpx, brpy] = trig.get_arch_bearings(rpb, 70);
	brpx += jet_x;
	brpy += jet_y;
	//print("cords | " + [brpx, brpy]);
	let lpb = (jet_bearing + 773) % 800;
	[blpx, blpy] = trig.get_arch_bearings(lpb, 70);
	blpx += jet_x;
	blpy += jet_y;
	//print("cords | " + [blpx, blpy]);
	//trig.log_heading("standard-pie-prototype");
	//[x1, y1] = trig.get_arch_bearings(rbearing, 0);
	cr.moveTo(jet_x, jet_y);
	cr.lineTo(brpx, brpy);
	cr.lineTo(blpx, blpy);
	cr.moveTo(jet_x, jet_y);
	cr.setSourceRGB((1), (1), (1));
	cr.closePath();
	*/

	// vno-demei
	trig.log_heading("vno-demei");
	let revb = (jet_bearing + 400) % 800;
	let lb = (jet_bearing + 600) % 800;
	let rb = (jet_bearing + 200) % 800;
	print("jet-bearing | " + jet_bearing);
	print("right-bearing | " + rb);
	print("left-bearing | " + lb);
	print("reverse-bearing | " + revb);
	let x1, y1, x2, y2;
	// et-press-nose
	cr.setSourceRGB(1, 1, 1);
	let press_portion = 7;
	cr.setLineWidth(press_portion);
	[x1, y1] = trig.get_arch_bearings(revb, press_portion);
	x1 += jet_x;
	y1 = jet_y - y1;
	// seems a bizar cypher for the radion params; the stamping shouts we are quested to discover from here, instead; a clerk around for now.
	cr.arc(x1, y1, press_portion, trig.naof_radions(0), trig.naof_radions(800));
	cr.stroke();

	cr.setSourceRGB(1, 1, 1);
	cr.setLineWidth(1);
	cr.arc(jet_x, jet_y, 1, 0, 6.283185307179586);
	cr.stroke();
	/*
	*/

	// hexil-glotch
	// ----
	// nose
	// ----
	[x2, y2] = trig.get_arch_bearings(revb, ((press_portion / 1.9) - 3));
	x2 += jet_x;
	y2 = jet_y - y2;
	let nose_et = [x2, y2]
	print("cords | " + [nose_et[0], nose_et[1]]);
	cr.moveTo(nose_et[0], nose_et[1]);

	/*
	cr.setSourceRGB(1, 0, 0);
	cr.setLineWidth(1);
	cr.arc(nose_et[0], nose_et[1], 1, 0, 6.283185307179586);
	cr.stroke();
	*/

	let nose_portion = 10;
	[x1, y1] = trig.get_arch_bearings(rb, nose_portion);
	x1 += x2;
	y1 = y2 - y1;
	print("cords | " + [x1, y1]);
	cr.lineTo(x1, y1);

	/*
	cr.setSourceRGB(1, 0, 0);
	cr.setLineWidth(1);
	cr.arc(x1, y1, 1, 0, 6.283185307179586);
	cr.stroke();
	*/

	let nose_drive = (nose_portion * 0.7);
	let nose_bearing = revb + 17;
	[x2, y2] = trig.get_arch_bearings(nose_bearing, nose_drive);
	x2 += x1;
	y2 = y1 - y2;
	print("cords | " + [x2, y2]);
	cr.lineTo(x2, y2);
	let nbr = [x2, y2];

	/*
	cr.setSourceRGB(1, 0, 0);
	cr.setLineWidth(1);
	cr.arc(x2, y2, 1, 0, 6.283185307179586);
	cr.stroke();
	*/

	cr.moveTo(nose_et[0], nose_et[1]);
	[x1, y1] = trig.get_arch_bearings(lb, nose_portion);
	x1 += nose_et[0];
	y1 = nose_et[1] - y1;
	print("cords | " + [x2, y2]);
	cr.lineTo(x1, y1);

	/*
	cr.setSourceRGB(1, 0, 0);
	cr.setLineWidth(1);
	cr.arc(x1, y1, 1, 0, 6.283185307179586);
	cr.stroke();
	*/

	nose_bearing = revb - 17;
	[x2, y2] = trig.get_arch_bearings(nose_bearing, nose_drive);
	x2 += x1;
	y2 = y1 - y2;
	print("cords | " + [x2, y2]);
	cr.lineTo(x2, y2);
	cr.lineTo(nbr[0], nbr[1]);

	/*
	cr.setSourceRGB(1, 0, 0);
	cr.setLineWidth(1);
	cr.arc(x2, y2, 1, 0, 6.283185307179586);
	cr.stroke();
	*/

	cr.setSourceRGB((1), (0), (0));
	cr.closePath();
	cr.fill();
}

let equanaox_name = undefined;
let ancient_equanaox_name = undefined;
let cloud_site = undefined;
let ancient_cloud_site = undefined;
let ancient_cloud_direction = undefined;
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
	//print("equanaox-name | " + equanaox_name);
	//print("equanaox-facter | " + equanaox_facter);
	//print("rgb  | " + rgb);
	//print("brgb | " + brgb);
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
	draw_jet(cr);
	return false; // Propagate event
});

// Setup animation timer (approx 60 FPS)
GLib.timeout_add(GLib.PRIORITY_HIGH, 16, () => {
	//     <--> dat a dat.
	//t = Dat.now();
	t = Date.now();
	drawingArea.queue_draw();
	let seed = Math.random();
	//print("width | " + width);
	//print("height | " + height);
	// movements
	let x1, y1;
	//let distance = 41.97 * jet_speed;
	let distance = 35.976 * jet_speed;
	//print("jet-speed | " + jet_speed);
	//print("distance | " + distance);
	[x1, y1] = trig.get_arch_bearings(jet_bearing, distance);
	jet_x += x1;
	jet_y = jet_y - y1;
	let in_new_folds = false;
	let direction = undefined;
	if(jet_x < 0) {
		in_new_folds = true;
		jet_x += width;
		direction = 0;
	}
	if(jet_x >= width) {
		in_new_folds = true;
		jet_x = jet_x - width;
		direction = 1;
	}
	if(jet_y < 0) {
		in_new_folds = true;
		jet_y += height;
		direction = 2;
	}
	if(jet_y >= height) {
		in_new_folds = true;
		jet_y = jet_y - height;
		direction = 3;
	}
	if(in_new_folds) {
		/*
		// seems ancient features are ratcheded.
		// we are in a tornado realm in timewarp; the tableture does mention.
		trig.log_heading("ancientsegment");
		print("direction | " + direction);
		print("ancient-cloud-direction | " + ancient_cloud_direction);
		print("cloud-site | " + cloud_site);
		print("ancient-cloud-site | " + ancient_cloud_site);
		if((equanaox_name == "dawn") || (equanaox_name == "dusk")) {
			ancient_cloud_site = cloud_site;
			if(direction == 0 && ancient_cloud_direction == 1) {
				print("ancient cloud memory.");
				cloud_site = ancient_cloud_site;
			} else {
				cloud_site = parseInt(naof_clouds * Math.random());
			}
			ancient_cloud_direction = direction;
		} else if((equanaox_name == "shock") || (equanaox_name == "noom")) {
			seed_stars();
		}
		print("cloud-site | " + cloud_site);
		*/
		if((equanaox_name == "dawn") || (equanaox_name == "dusk")) {
			cloud_site = parseInt(naof_clouds * Math.random());
		} else if((equanaox_name == "shock") || (equanaox_name == "noom")) {
			seed_stars();
		}
	}
	return true; // Keep timer running
});

let fs_mode = 0;
win.connect("key-press-event", (widget, event) => {
	// Get key value
	let [, keyval] = event.get_keyval();
	//print("key | " + keyval);

	// Check for specific key (e.g., Escape)
	if (keyval == Gdk.KEY_Escape) {
		log("engaging afto ... set-in -|- solid"); // afto | auto-friction-to-ordinance
		win.close();
		return true; // Event handled
	} else if(keyval == Gdk.KEY_Up) {
		jet_speed += 0.1;
		jet_speed %= 1;
		//print("jet-speed | " + jet_speed);
	} else if(keyval == Gdk.KEY_Down) {
		jet_speed -= 0.1;
		if(jet_speed < 0) {
			jet_speed = 0;
		}
		//print("jet-speed | " + jet_speed);
	} else if(keyval == Gdk.KEY_Left) {
		jet_bearing = (jet_bearing + 10) % 800;
		//print("jet-bearing | " + jet_bearing);
		return true;
	} else if(keyval == Gdk.KEY_Right) {
		jet_bearing = (jet_bearing - 10);
		if(jet_bearing < 0) {
			jet_bearing += 800;
		}
		//print("jet-bearing | " + jet_bearing);
		return true;
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
	//print("width  | " + width);
	//print("height | " + height);
	//print("configure-event-(resize) | [" + width + ", ", height + "]");
	let naof_stars = stars.length
	seed_stars();
	return false;
});


win.show_all();
Gtk.main();
