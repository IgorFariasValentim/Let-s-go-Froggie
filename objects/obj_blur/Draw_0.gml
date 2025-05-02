var c	  = c_black;
var tocha = instance_exists(obj_tocha);
var luz	  = instance_exists(obj_luz);

if (surface_exists(surf)){
	
	surface_set_target(surf);
	
	//desenhando a escuridão
	draw_set_alpha(.4);
	draw_set_color(c);
	
	draw_rectangle(0,0,surf_w,surf_h,false);
	
	draw_set_alpha(1);
	draw_set_color(-1);
	
	//desenhando a iluminação
	gpu_set_blendmode(bm_subtract);
	
	// luz nas tochas
	if (tocha){
		var num_tocha = instance_number(obj_tocha);
		
		for (var i = 0; i < num_tocha;i++){
			var find = instance_find(obj_tocha,i);
			
			draw_set_alpha(.2);
			draw_circle(find.x,find.y,78 + irandom(3),false);
			draw_set_alpha(1);
	
			draw_circle(find.x,find.y,48 + irandom(3),false);
		}
	}
	
	//luz nos postes e etc
	if (luz){
		var num_luz = instance_number(obj_luz);
		
		for (var l = 0; l < num_luz;l++){
			var find_luz = instance_find(obj_luz,l);
			
			draw_set_alpha(.2);
			draw_circle(find_luz.x,find_luz.y,78 + irandom(3),false);
			draw_set_alpha(1);
	
			draw_circle(find_luz.x,find_luz.y,48 + irandom(3),false);
		}
	}
	
	//draw_set_alpha(.3);
	//draw_circle(obj_tocha.x,obj_tocha.y,48 + irandom(3),false);
	//draw_set_alpha(1);
	
	//draw_circle(obj_tocha.x,obj_tocha.y,32 + irandom(3),false);
	
	gpu_set_blendmode(bm_normal);
	
	surface_reset_target();
	
	draw_surface(surf,0,0);
}else{
	surf = surface_create(surf_w,surf_h);
}

















