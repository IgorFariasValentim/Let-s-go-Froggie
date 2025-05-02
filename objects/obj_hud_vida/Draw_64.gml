switch(global.vida){
	case 4:
		global.subvida = 0;
	break;
	
	case 3.5:
		global.subvida = 1;
	break;
	
	case 3:
		global.subvida = 2;
	break;
	
	case 2.5:
		global.subvida = 3;
	break;
	
	case 2:
		global.subvida = 4;
	break;
	
	case 1.5:
		global.subvida = 5;
	break;
	
	case 1:
		global.subvida = 6;
	break;
	
	case 0.5:
		global.subvida = 7;
	break;
	
	case 0:
		global.subvida = 8;
	break;
}

draw_sprite_stretched(spr_froggiehpcicle,global.subvida,60,0,256,256);

draw_sprite_stretched(spr_froggiehp,global.subhp,-3,-18,256,256);



















