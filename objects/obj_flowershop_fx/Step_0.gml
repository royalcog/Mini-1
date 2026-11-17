door_open   += clamp(door_target - door_open, -door_speed, door_speed);
window_dark += clamp(window_target - window_dark, -window_speed, window_speed);