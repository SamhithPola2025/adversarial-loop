rightKey = keyboard_check(vk_right) || keyboard_check(ord("D"));
leftKey  = keyboard_check(vk_left) || keyboard_check(ord("A"));
jumpKeyPressed = keyboard_check_pressed(vk_up) || keyboard_check(ord("W"));

moveDir = rightKey - leftKey;
xspd = moveDir * moveSpd;

if (!place_meeting(x + xspd, y, oPlatform)) {
    x += xspd;
} else {
    while (!place_meeting(x + sign(xspd), y, oPlatform)) {
        x += sign(xspd);
    }
    xspd = 0;
}

yspd += grav;

if (jumpKeyPressed && jumps_left > 0) {
    yspd = jspd;
    jumps_left--;
}

var _subPixel = 0.5;
if (place_meeting(x, y + yspd, oPlatform)) {
    var _pixelCheck = _subPixel * sign(yspd);
    while (!place_meeting(x, y + _pixelCheck, oPlatform)) {
        y += _pixelCheck;
    }
    yspd = 0;
}

y += yspd;

if (place_meeting(x, y + 1, oPlatform)) {
    jumps_left = max_jumps;
}

if (place_meeting(x,y,oFlag)) {
	room_goto(level2);
}

if (place_meeting(x, y, oSpikes)) {
    room_restart();
}