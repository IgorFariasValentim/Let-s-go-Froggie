if instance_place(x,y-1,obj_player){
	vsp = dir * spd;

	var _limited = place_meeting(x,y+sign(vsp),obj_colider_e);
	var _colide_player = place_meeting(x,y+1,obj_player) || place_meeting(x,y-1,obj_player);
	
	if (_limited) {dir *= -1}

	if (_colide_player){
		with(obj_player){
			y += other.vsp
		}
	}

	y += vsp;
}
