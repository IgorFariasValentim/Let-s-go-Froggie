if !instance_exists(obj_inventario) and !instance_exists(obj_dialogo){
	dir = point_direction(0,0,sign(hsp),0);
	hsp = lengthdir_x(spd,dir);

	var _colide = place_meeting(x+hsp,y,obj_colider);
	var _limited = place_meeting(x+sign(hsp),y,obj_colider_e);
	var _colide_player = place_meeting(x+sign(hsp),y,obj_player) || place_meeting(x,y-1,obj_player);
	
	if (_limited) hsp *= -1;
	if (_colide) hsp *= -1;
	if (_colide_player){
		with(obj_player){
			if (place_meeting(x,y+1,obj_flyplataform_h)){
				if (!place_meeting(x+other.hsp,y,obj_colider)){
					x += other.hsp;
				}
			}
		}
	}

	x += hsp;
}