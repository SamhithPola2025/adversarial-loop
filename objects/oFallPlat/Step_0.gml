// only start falling if player is on top
if (!falling) {
    // check if player bottom is touching the top of the platform
    var player_on_top = instance_place(x, y - 1, oPlayer);
    if (player_on_top) {
        // make sure player is above, not below or side
        if (player_on_top.y + player_on_top.sprite_height/2 <= y - 2) {
            falling = true;
        }
    }
}

// if falling, move down with gravity
if (falling) {
    fall_speed += gravity;
    y += fall_speed;
    
    // optional: stop at floor
    if (y > room_height - sprite_height/2) {
        y = room_height - sprite_height/2;
        fall_speed = 0;
        falling = false;
    }
}
