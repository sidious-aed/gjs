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
let draw_engine = function(cr, et_x, et_y) {
	let revb = (jet_bearing + 400) % 800;
	let lb = (jet_bearing + 200) % 800;
	let rb = (jet_bearing + 600) % 800;
	let eng_et_dr = 5;
	let eng_flame_dr = 3.2
	let eng_lai_dr = 20;
	let x1, y1, x2, y2;
	let eng_hex = 20;
	let eng_hexb = ((revb + eng_hex) % 800);
	let reng_hexb = ((revb + (800 - eng_hex)) % 800);
	print("et-x | " + et_x);
	print("et-y | " + et_y);

	/*
	print("etr-cords | " + etr_cords);

	[x2, y2] = trig.get_arch_bearings(revb, eng_et_dr);
	x2 += x1;
	y2 = y1 - y2;
	cr.lineTo(x2, y2);
	let ebr_cords = [x1, y1]
	print("ebr-cords | " + ebr_cords);

	[x1, y1] = trig.get_arch_bearings(lb, eng_et_dr);
	x1 += x2;
	y1 = y2 - y1;
	cr.lineTo(x1, y1);
	let ebl_cords = [x1, y1]
	print("ebl-cords | " + ebl_cords);
	*/

	cr.moveTo(et_x, et_y);
	[x1, y1] = trig.get_arch_bearings(rb, eng_et_dr);
	x1 += et_x;
	y1 = et_y - y1;
	cr.lineTo(x1, y1);
	let etr_cords = [x1, y1];
	print("etr-cords | " + etr_cords);

	[x2, y2] = trig.get_arch_bearings(eng_hexb, eng_lai_dr);
	x2 += x1;
	y2 = y1 - y2;
	cr.lineTo(x2, y2);
	//print("emr-cords | " + [x2, y2]);

	[x1, y1] = trig.get_arch_bearings(reng_hexb, eng_lai_dr);
	x1 += x2;
	y1 = y2 - y1;
	cr.lineTo(x1, y1);
	let ebr_cords = [x1, y1];

	[x2, y2] = trig.get_arch_bearings(lb, eng_et_dr);
	x2 += x1;
	y2 = y1 - y2;
	cr.lineTo(x2, y2);

	[x1, y1] = trig.get_arch_bearings(((eng_hexb + 400) % 800), eng_lai_dr);
	x1 += x2;
	y1 = y2 - y1;
	cr.lineTo(x1, y1);
	/*
	*/

	cr.lineTo(et_x, et_y);
	cr.setSourceRGB((0.3), (0.3), (0.3));
	cr.closePath();
	cr.fill();

	let eng_flame_dr_portion = eng_flame_dr / 2;
	[x1, y1] = trig.get_arch_bearings(lb, (eng_et_dr - ((eng_et_dr - eng_flame_dr) / 2)));
	x1 += ebr_cords[0];
	y1 = ebr_cords[1] - y1;
	let flame_tr = [x1, y1];
	cr.moveTo(x1, y1);
	[x2, y2] = trig.get_arch_bearings(rb, (eng_flame_dr));
	x2 += x1;
	y2 = y1 - y2;
	let flame_tl = [x2, y2];
	cr.lineTo(x2, y2);

	[x1, y1] = trig.get_arch_bearings(lb, (eng_flame_dr_portion));
	x1 += x2;
	y1 = y2 - y1;
	[x2, y2] = trig.get_arch_bearings(revb, (21 * jet_speed));
	x2 += x1;
	y2 = y1 - y2;
	cr.lineTo(x2, y2);

	cr.lineTo(flame_tr[0], flame_tr[1]);
	cr.setSourceRGB((0.9), (0.3), (0.3));
	cr.closePath();
	cr.fill();
	/*
	*/
	return;
}
let draw_jet = function(cr) {
	let revb = (jet_bearing + 400) % 800;
	let lb = (jet_bearing + 200) % 800;
	let rb = (jet_bearing + 600) % 800;
	print("jet-bearing | " + jet_bearing);
	print("right-bearing | " + rb);
	print("left-bearing | " + lb);
	print("reverse-bearing | " + revb);
	let stage_0_portion = 11;
	let press_portion = 8;
	let x1, y1, x2, y2;

	//var hgns = []; // hgns | hexil-glotch-nodes
	// ------------
	// hexil-glotch
	// ------------
	// right-stage-0
	trig.log_heading("core-stage-0-right")
	var jg = trig.create_bobj(jet_x, jet_y);
	print("jg | " + [jg.x, jg.y]);

	jg.gg(rb, stage_0_portion);
	print("jg | " + [jg.x, jg.y]);

	let stage_1_bearing = ((revb + 72) % 800);
	let stage_1_dam = 21;
	jg.gg(stage_1_bearing, stage_1_dam);
	print("jg | " + [jg.x, jg.y]);
	let rs0b_cords = [jg.x, jg.y];

	// right-stage-1
	let ldampin_drive = 27;
	jg.gg(((revb + (800 - 72)) % 800), ldampin_drive);
	print("jg | " + [jg.x, jg.y]);
	let com_cords = [jg.x, jg.y];

	// left-stage-0
	jg.move_to(jet_x, jet_y);
	jg.gg(lb, stage_0_portion);
	print("jg | " + [jg.x, jg.y]);

	stage_1_bearing = ((revb + 728) % 800);
	jg.gg(stage_1_bearing, stage_1_dam);
	print("jg | " + [jg.x, jg.y]);
	let left_stage_0_cords = [jg.x, jg.y];
	let ls0b_cords = [jg.x, jg.y];

	// left-stage-1
	//jg.move_to(left_stage_0_cords[0], left_stage_0_cords[1]);
	jg.gg(((revb + 72) % 800), ldampin_drive);
	let lcom_cords = [jg.x, jg.y];
	jg.line_to(com_cords[0], com_cords[1]);
	print("jg | " + [jg.x, jg.y]);

	// right-wing
	let wing_drive = 39;
	let wingb = 132;
	jg.move_to(rs0b_cords[0], rs0b_cords[1]);
	jg.gg(((rb + (800 - wingb)) % 800), wing_drive);
	jg.line_to(com_cords[0], com_cords[1]);

	// left-wing
	jg.move_to(ls0b_cords[0], ls0b_cords[1]);
	jg.gg(((lb + wingb) % 800), wing_drive);
	jg.line_to(lcom_cords[0], lcom_cords[1]);
	/*
	*/

	[x1, y1] = trig.get_arch_bearings(jet_bearing, (27));
	com_cords[0] += x1;
	com_cords[1] -= y1;
	draw_engine(cr, com_cords[0], com_cords[1]);
	lcom_cords[0] += x1;
	lcom_cords[1] -= y1;
	draw_engine(cr, lcom_cords[0], lcom_cords[1]);

	trig.log_heading("implement-nodes.")
	let naof_nodes = jg.nodes.length;
	let hsite = 0;
	while(true) {
		if(hsite == naof_nodes) {
			break;
		}
		let node = jg.nodes[hsite];
		print("node | " + node);
		if(node[0] == 0) {
			cr.moveTo(node[1], node[2]);
		} else {
			cr.lineTo(node[1], node[2]);
		}
		/*
		cr.setSourceRGB(1, 0, 0);
		cr.setLineWidth(1);
		cr.arc(node[1], node[2], 1, 0, 6.283185307179586);
		cr.stroke();
		*/
		hsite += 1;
	}

	cr.setSourceRGBA((0.3), (0.3), (0.3), 1);
	cr.closePath();
	cr.fill();
	return;
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
		if(jet_speed > 1) {
			jet_speed = 1;
		}
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
