// find player if needed
if (player == noone && instance_exists(oPlayer)) {
    player = instance_find(oPlayer, 0);
}

if (player != noone) {

    // activate spike if player is close horizontally
    if (!active && abs(player.x - x) < 100) { // adjust 64 for detection range
        active = true;
        targetY = player.y - 32; // spike will jump above player's head, adjust 32 as needed
    }

    // move spike toward targetY if active
    if (active) {
        if (y > targetY) {
            y -= spd;
            if (y < targetY) y = targetY;
        } else {
            // once it reaches target, fall back down
            y += spd;
            if (y > 400) { // 400 = ground level, replace with your level floor
                y = 400;
                active = false;
            }
        }
    }
}
