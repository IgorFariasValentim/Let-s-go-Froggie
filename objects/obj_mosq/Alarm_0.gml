if (state == "warning") {
    var dir = point_direction(x, y, obj_player.x, obj_player.y);
    target_x = x + lengthdir_x(dash_distance, dir);
    target_y = y + lengthdir_y(dash_distance, dir);
    state = "dash";
    show_exclamation = false;
}