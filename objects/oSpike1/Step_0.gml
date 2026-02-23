// find player instance if we don't have one
if (player == noone && instance_exists(oPlayer)) {
    player = instance_find(oPlayer, 0);
}

if (player != noone) {

    // only react if player is in the air
    if (player.yspd != 0) {

        // check if player is horizontally close enough (above this spike)
        var horiz_dist = abs(player.x - x);
        if (horiz_dist < 32) {  // adjust 32 to roughly half player width
            // predict landing x position
            var landing_x = player.x + player.xspd * (player.yspd / player.grav);

            // move spike toward predicted landing x
            var dir = sign(landing_x - x);
            x += dir * spd;
        }
    }
}
