// input
rightKey = keyboard_check(vk_right) || keyboard_check(ord("D"));
leftKey  = keyboard_check(vk_left) || keyboard_check(ord("A"));
jumpKeyPressed = keyboard_check_pressed(vk_up) || keyboard_check(ord("W"));

// horizontal movement
moveDir = rightKey - leftKey;

// use different speeds on ground vs in air
if (place_meeting(x, y + 1, oPlatform)) { // on ground
    xspd = moveDir * moveSpd;
} else { // in air
    xspd = moveDir * airMoveSpd; // set airMoveSpd in create event
}

// horizontal collision
if (!place_meeting(x + xspd, y, oPlatform)) {
    x += xspd;
} else {
    while (!place_meeting(x + sign(xspd), y, oPlatform)) {
        x += sign(xspd);
    }
    xspd = 0;
}

// vertical movement
yspd += grav;

if (jumpKeyPressed && jumps_left > 0) {
    yspd = jspd;
    jumps_left--;
}

// vertical collision with subpixel adjustment
var _subPixel = 0.5;
if (place_meeting(x, y + yspd, oPlatform)) {
    var _pixelCheck = _subPixel * sign(yspd);
    while (!place_meeting(x, y + _pixelCheck, oPlatform)) {
        y += _pixelCheck;
    }
    yspd = 0;
}

y += yspd;

// reset jumps when touching the ground
if (place_meeting(x, y + 1, oPlatform)) {
    jumps_left = max_jumps;
}

// room/level transitions
if (place_meeting(x,y,oFlag)) {
	room_goto(level2);
}

if (place_meeting(x,y,oFlag2)) {
	room_goto(level3);
}


if (place_meeting(x,y,oFlag3)) {
	room_goto(level4);
}

if (place_meeting(x,y,oFlag4)) {
	room_goto(level5);
}

// hazards
if (place_meeting(x, y, oSpike1)) || (place_meeting(x,y,oSpike2)) || (place_meeting(x,y,oNormalSpike)) {
    room_restart();
}

if (x < 0 || x > room_width || y < 0 || y > room_height) {
	room_restart();
}
