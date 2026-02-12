#!/usr/bin/env gjs
imports.searchPath.push(".");
const trig = imports.trig;
trig.i_sim();

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

log_heading("archions");
let archions = 0;
while(true) {
	if(archions > 800) {
		break;
	}
	print("get_arch_bearings(" + archions + ", 5) | " + trig.get_arch_bearings(archions, 5));
	archions += 10;
	//print("\n");
}
/*
log_heading("degrees");
let degrees = 10.5;
while(true) {
	if(degrees > 400) {
		break;
	}
	print("get_fort_bearings(" + degrees + ", 5) | " + trig.get_fort_bearings(degrees, 5));
	degrees += 50;
	//print("\n");
}
log_heading("naof-radions");
print("naof-radions(173) | " + trig.naof_radions(173));
print("naof-radions(790) | " + trig.naof_radions(790));
log_heading("sf-angles");
let archions0 = 130
let archions1 = 140
let archions2 = 150
let x = 100
let y = 100
let grid = trig.get_arch_bearings(archions0, 10)
x += grid[0]
y += grid[0]
trig.get_arch_bearings(archions1, 10)
grid = trig.get_arch_bearings(archions0, 10)
x += grid[0]
y += grid[0]
trig.get_arch_bearings(archions2, 10)
grid = trig.get_arch_bearings(archions0, 10)
x += grid[0]
y += grid[0]
let x_distance = x - 100
let y_distance = y - 100
print("x-distance | " + x_distance);
print("y-distance | " + y_distance);
*/
