hsp = 0;
spd = 3;
if instance_exists(obj_player) dir = point_direction(x,y,obj_player.x,obj_player.y - 16);
vsp = 0;
bateu = false;
hsp = lengthdir_x(spd,dir);
vsp = lengthdir_y(spd,dir);