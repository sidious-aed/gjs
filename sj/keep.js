// ---------
// vno-demei
// ---------
let stage_0_portion = 11;
[x1, y1] = trig.get_arch_bearings(revb, ((press_portion / 1.9) - 2));
trig.log_heading("vno-demei");
let x1, y1, x2, y2;
// et-press-nose
cr.setSourceRGB(1, 1, 1);
let press_portion = 8;
cr.setLineWidth(press_portion);
[x1, y1] = trig.get_arch_bearings(revb, press_portion);
x1 += jet_x;
y1 = jet_y - y1;
// seems a bizar cypher for the radion params; the stamping shouts we are quested to discover from here, instead; a clerk around for now.
cr.setSourceRGB(0.3, 0.3, 0.3);
cr.arc(x1, y1, press_portion, trig.naof_radions(0), trig.naof_radions(800));
cr.stroke();
/*
trig.log_heading("hexil-glotch");
[x2, y2] = trig.get_arch_bearings(jet_bearing, (press_portion * 2));
x2 += x1;
y2 = y1 - y2;
let ram_et = [x2, y2];
*/

// right-wing
//jg.gg(rwb, wing_drive);
print("jg | " + [jg.x, jg.y]);
// left-wing
let lwb = ((lb + wingb) % 800);
//jg.gg(lwb, wing_drive);
print("jg | " + [jg.x, jg.y]);
//hgns.push([1, jg.x, jg.y])

// core-stage-0
let stage_0_portion = 11;
[x2, y2] = trig.get_arch_bearings(revb, ((press_portion / 1.9) - 2));
x2 += jet_x;
y2 = jet_y - y2;
let stage_0_et = [x2, y2]
print("cords | " + [stage_0_et[0], stage_0_et[1]]);
//cr.moveTo(stage_0_et[0], stage_0_et[1]);
hgns.push([0, stage_0_et[0], stage_0_et[1]])

/*
cr.setSourceRGB(1, 0, 0);
cr.setLineWidth(1);
cr.arc(stage_0_et[0], stage_0_et[1], 1, 0, 6.283185307179586);
cr.stroke();
*/

/*
[x1, y1] = trig.get_arch_bearings(rb, stage_0_portion);
x1 += x2;
y1 = y2 - y1;
print("cords | " + [x1, y1]);
//cr.lineTo(x1, y1);
hgns.push([1, x1, y1])
// core-stage-0
let stage_0_drive = (stage_0_portion * 0.7);
let stage_0_bearing = revb + 17;
[x2, y2] = trig.get_arch_bearings(stage_0_bearing, stage_0_drive);
x2 += x1;
y2 = y1 - y2;
print("cords | " + [x2, y2]);
cr.lineTo(x2, y2);
*/

// core-stage-1
let cs1x, cs1y;
let stage_1_bearing = ((revb + 72) % 800);
let stage_1_dam = 21;
print("stage-1-bearing | " + stage_1_bearing);
[cs1x, cs1y] = trig.get_arch_bearings(stage_1_bearing, stage_1_dam);
//print("cords | " + [x1, y1]);
cs1x += x1;
cs1y = y1 - cs1y;
print("cords | " + [cs1x, cs1y]);
//cr.lineTo(cs1x, cs1y);
hgns.push([1, cs1x, cs1y])
let stage_1_cords = [cs1x, cs1y];

// right-wing
let wing_drive = 39;
let wingb = 102;
let rwb = ((rb + (800 - wingb)) % 800);
//print("trig.get_arch_bearings((rwb), 21) | " + trig.get_arch_bearings((rwb), 21));
[x2, y2] = trig.get_arch_bearings((rwb), wing_drive);
x2 += cs1x;
y2 = cs1y - y2;
print("rw-cords | " + [x2, y2]);
//cr.lineTo(x2, y2);
hgns.push([1, x2, y2])
let right_wing_node = [x2, y2];

// core-stage-2
let ldampin_drive = 27;
[x2, y2] = trig.get_arch_bearings(revb, ldampin_drive);
print("c2-cords | " + [x2, y2]);
x2 += stage_1_cords[0];
y2 = stage_1_cords[1] - y2;
print("cords | " + [x2, y2]);
//cr.lineTo(x2, y2);
hgns.push([1, x2, y2])
let stage_2_cords = [x2, y2];

// core-stage-3
[x2, y2] = trig.get_arch_bearings(((revb + (800 - 72)) % 800), ldampin_drive);
x2 += stage_2_cords[0];
y2 = stage_2_cords[1] - y2;
print("cords | " + [x2, y2]);
//cr.lineTo(x2, y2);
hgns.push([1, x2, y2])
let nbr = [x2, y2];
/*
*/

//cr.moveTo(stage_0_et[0], stage_0_et[1]);
//hgns.push([0, stage_0_et[0], stage_0_et[1]])
[x1, y1] = trig.get_arch_bearings(lb, stage_0_portion);
x1 += stage_0_et[0];
y1 = stage_0_et[1] - y1;
print("cords | " + [x2, y2]);
//cr.lineTo(x1, y1);
hgns.push([1, x1, y1])

/*
// core-stage-0
stage_0_bearing = ((revb + 17) % 800);
[x2, y2] = trig.get_arch_bearings(stage_0_bearing, stage_0_drive);
x2 += x1;
y2 = y1 - y2;
print("cords | " + [x2, y2]);
cr.lineTo(x2, y2);
*/

// core-stage-1
stage_1_bearing = ((revb + 728) % 800);
[cs1x, cs1y] = trig.get_arch_bearings(stage_1_bearing, stage_1_dam);
cs1x += x1;
cs1y = y1 - cs1y;
print("cords | " + [cs1x, cs1y]);
//cr.lineTo(cs1x, cs1y);
hgns.push([1, cs1x, cs1y])
let stage_1_cords_2 = [cs1x, cs1y]

// left-wing
let lwb = ((lb + wingb) % 800);
let lwx, lwy;
[lwx, lwy] = trig.get_arch_bearings((lwb), wing_drive);
lwx += cs1x;
lwy = cs1y - lwy;
print("lw-cords | " + [x2, y2]);
//cr.lineTo(lwx, lwy);
hgns.push([1, lwx, lwy])
let left_wing_node = [lwx, lwy];

// core-stage-2
print("c2-cords | " + trig.get_arch_bearings(revb, ldampin_drive));
[x2, y2] = trig.get_arch_bearings(revb, ldampin_drive);
print("c2-cords | " + [x2, y2]);
x2 += stage_1_cords_2[0];
y2 = stage_1_cords_2[1] - y2;
print("cords | " + [x2, y2]);
//cr.lineTo(x2, y2);
hgns.push([1, x2, y2])
let stage_2_cords_2 = [x2, y2];

// core-stage-3
//print("c3-cords | " + trig.get_arch_bearings((revb + 17), ldampin_drive));
[x1, y1] = trig.get_arch_bearings((revb + 72), ldampin_drive);
x1 += x2;
y1 = y2 - y1;
print("cords | " + [x1, y1]);
//cr.lineTo(x1, y1);
hgns.push([1, x1, y1])

/*
cr.setSourceRGB(1, 0, 0);
cr.setLineWidth(1);
cr.arc(x2, y2, 1, 0, 6.283185307179586);
cr.stroke();
*/

//cr.lineTo(nbr[0], nbr[1]);
hgns.push([1, nbr[0], nbr[1]])


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
