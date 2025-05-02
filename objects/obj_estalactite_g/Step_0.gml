
switch(state){
	case "idle":
		if (obj_player.x > x - sprite_width/2 && 
		    obj_player.x < x + sprite_width/2 && 
		    obj_player.y > y) {
			state = "passou";
		}
	break;
	
	case "passou":
		passou = true;
		if (passou){
			state = "tremendo";
		}
	break;
	
	case "tremendo":
		time_treme--;
		hsp = random_range(-0.5,.5);
		vsp = random_range(-0.5,.5);
		if (time_treme <= 0) state = "caindo";
	break;
	
	case "caindo":
		hsp = 0;
		vsp += grav;
		if instance_place(x,y+vsp,obj_colider) state = "caiu";
	break;
	
	case "caiu": 
		vsp = 0;
		hsp = 0;
	break;
}

x += hsp;
y += vsp;