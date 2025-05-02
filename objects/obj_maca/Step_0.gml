if !instance_exists(obj_inventario) and !instance_exists(obj_dialogo){
	vsp+=grav

	if (place_meeting(x+sign(hsp),y,obj_colider) or place_meeting(x,y+sign(vsp),obj_colider)){
		hsp = 0;
		vsp = 0;
	}

	if place_meeting(x,y,obj_player){
		take_item(item_maca);
		instance_destroy();
	}

	y+=vsp;
	x+=hsp;
}