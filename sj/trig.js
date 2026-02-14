let i_sim = function() {
	print("Talkei talkei. Airgo vah nah goo trim brader.");
}

let create_bobj = function(x, y) {
	print("create-bobj.");
	let bobj = {
		x: x,
		y: y,
		nodes: [[0, x, y]],
		move_to: function(x, y) {
			this.x = x;
			this.y = y;
			this.nodes.push([0, this.x, this.y])
			return;
		},
		line_to: function(x, y) {
			this.x = x;
			this.y = y;
			this.nodes.push([1, this.x, this.y])
		},
		gg: function(archions, distance) { // gg | go grid
			archions %= 800;
			//print("archions | " + archions);
			let mode = parseInt(archions / 100);
			let fmode;
			if((mode & 1) == 0) {
				fmode = 0;
			} else {
				fmode = 1;
			}
			print("mode | " + mode);
			let d2 = distance * distance;
			let hb = Math.sqrt(d2 / 2); // hb | height-breadth
			//print("hb | " + hb);
			let arch_archions = archions % 100;
			//print("arch-archions | " + arch_archions);
			let facter;
			if(fmode == 0) {
				facter = arch_archions / 100.0;
			} else if(fmode == 1) {
				facter = (1 - (arch_archions / 100.0));
			}
			print("facter | " + facter);
			let y = hb * (facter);
			//print("y | " + y);
			let y2 = y * y;
			let x = Math.sqrt(d2 - y2);
			//print("x | " + x);
			let cords;
			if(facter == 0) {
				//print("facter is zero.");
				if(mode == 0) {
					//print("coords | " + [distance, 0]);
					cords =  [distance, 0];
				} else if(mode == 1) {
					cords =  [hb, hb];
				} else if(mode == 2) {
					cords =  [0, distance];
				} else if(mode == 3) {
					cords =  [-hb, hb];
				} else if(mode == 4) {
					cords =  [-distance, 0];
				} else if(mode == 5) {
					cords =  [-hb, -hb];
				} else if(mode == 6) {
					//print("in mode 6.");
					cords =  [0, -distance];
				} else if(mode == 7) {
					cords =  [hb, -hb];
				}
			} else {
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
			}
			print("bobj-cords | " + cords);
			this.x += cords[0];
			this.y = this.y - cords[1];
			this.nodes.push([1, this.x, this.y])
			return cords;
		}
	}
	return bobj;
}

let get_arch_bearings = function(archions, distance) {
	archions %= 800;
	//print("archions | " + archions);
	let mode = parseInt(archions / 100);
	let fmode;
	if((mode & 1) == 0) {
		fmode = 0;
	} else {
		fmode = 1;
	}
	//print("mode | " + mode);
	let d2 = distance * distance;
	let hb = Math.sqrt(d2 / 2); // hb | height-breadth
	//print("hb | " + hb);
	let arch_archions = archions % 100;
	//print("arch-archions | " + arch_archions);
	let facter;
	if(fmode == 0) {
		facter = arch_archions / 100.0;
	} else if(fmode == 1) {
		facter = (1 - (arch_archions / 100.0));
	}
	//print("facter | " + facter);
	if(facter == 0) {
		//print("facter is zero.");
		if(mode == 0) {
			//print("coords | " + [distance, 0]);
			return [distance, 0];
		} else if(mode == 1) {
			return [hb, hb];
		} else if(mode == 2) {
			return [0, distance];
		} else if(mode == 3) {
			return [-hb, hb];
		} else if(mode == 4) {
			return [-distance, 0];
		} else if(mode == 5) {
			return [-hb, -hb];
		} else if(mode == 6) {
			//print("in mode 6.");
			return [0, -distance];
		} else if(mode == 7) {
			return [hb, -hb];
		}
	}
	let y = hb * (facter);
	//print("y | " + y);
	let y2 = y * y;
	let x = Math.sqrt(d2 - y2);
	//print("x | " + x);
	let cords;
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
	print("bearing-to-grid-change-cords | " + cords);
	return cords;
}

let get_bearing_from_grid = function() {

}

let naof_radions = function(archions) {
	const radion_breadth = 6.283185307179586;
	let facter = archions / 800;
	return radion_breadth * facter;
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
	let d2 = distance * distance;
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

let log_heading = function(entree) {
	let naof_entree_secs = entree.length;
	let naof_bar_secs = naof_entree_secs + 4
	let bar = "";
	let site = 0;
	while(true) {
		if(site == naof_bar_secs) {
			break;
		}
		bar += "-";
		site += 1;
	}
	print(bar);
	print("| " + entree + " |");
	print(bar);
}	
