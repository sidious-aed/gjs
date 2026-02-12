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
let archions = 21;
while(true) {
	if(archions > 800) {
		break;
	}
	print("get_arch_bearings(" + archions + ", 5) | " + trig.get_arch_bearings(archions, 5));
	archions += 100;
	//print("\n");
}
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
