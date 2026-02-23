// define variables if they don't exist yet (optional but safe)
if (!variable_instance_exists(id, "falling")) {
    falling = false;
    fall_speed = 0;
    fall_accel = 0.5;
}

// start falling
falling = true;
