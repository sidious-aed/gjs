let i_sim = function() {
	print("Talkei talkei. Airgo vah nah goo trim brader.");
}

let get_arch_bearings = function(archions, distance) {
	let mode = parseInt(archions / 100);
	if((mode & 1) == 0) {
		mode = 0;
	} else {
		mode = 1;
	}
	//print("mode | " + mode);
	archions %= 800;
	let d2 = distance * 2;
	let hb = Math.sqrt(d2 / 2); // hb | height-breadth
	//print("hb | " + hb);
	let arch_archions = archions % 100;
	//print("arch-archions | " + arch_archions);
	let facter;
	if(mode == 0) {
		facter = arch_archions / 100.0;
	} else if(mode == 1) {
		facter = (1 - (arch_archions / 100.0));
	}
	//print("facter | " + facter);
	let y = hb * 	(facter);
	//print("y | " + y);
	let y2 = y * y;
	let x = Math.sqrt(d2 - y2);
	//print("x | " + x);
	let cords;
	mode = parseInt(archions / 100);
	//print("mode | " + mode);
	if(mode == 0) {
		cords = [x, y]
	} else if(mode == 1) {
		cords = [y, x]
	} else if(mode == 2) {
		cords = [-y, x]
	} else if(mode == 3) {
		cords = [-x, y]
	} else if(mode == 4) {
		cords = [-x, -y]
	} else if(mode == 5) {
		cords = [-y, -x]
	} else if(mode == 6) {
		cords = [y, -x]
	} else if(mode == 7) {
		cords = [x, -y]
	}
	return cords;
}

let get_fort_bearings = function(degrees, distance) {
	let mode = parseInt(degrees / 50);
	if((mode & 1) == 0) {
		mode = 0;
	} else {
		mode = 1;
	}
	//print("mode | " + mode);
	degrees %= 400;
	let d2 = distance * 2;
	let hb = Math.sqrt(d2 / 2); // hb | height-breadth
	//print("hb | " + hb);
	let arch_degrees = degrees % 50;
	//print("arch-degrees | " + arch_degrees);
	let facter;
	if(mode == 0) {
		facter = arch_degrees / 50.0;
	} else if(mode == 1) {
		facter = (1 - (arch_degrees / 50.0));
	}
	//print("facter | " + facter);
	let y = hb * 	(facter);
	//print("y | " + y);
	let y2 = y * y;
	let x = Math.sqrt(d2 - y2);
	//print("x | " + x);
	let cords;
	mode = parseInt(degrees / 50);
	//print("mode | " + mode);
	if(mode == 0) {
		cords = [x, y]
	} else if(mode == 1) {
		cords = [y, x]
	} else if(mode == 2) {
		cords = [-y, x]
	} else if(mode == 3) {
		cords = [-x, y]
	} else if(mode == 4) {
		cords = [-x, -y]
	} else if(mode == 5) {
		cords = [-y, -x]
	} else if(mode == 6) {
		cords = [y, -x]
	} else if(mode == 7) {
		cords = [x, -y]
	}
	return cords;
}
