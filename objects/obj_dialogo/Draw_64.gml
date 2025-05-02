var c = c_black;

if iniciar == true{
	var _barx = display_get_gui_width();
	
	b1 = lerp(b1,v1,0.1);
	b2 = lerp(b2,v2,0.1);
	
	draw_rectangle_color(0,0,_barx,b1,c,c,c,c,false);
	draw_rectangle_color(0,800,_barx,b2,c,c,c,c,false);
	
	draw_set_font(fnt_game);
	if (b2 <= 630){
		//draw dialogo
		var _guil = display_get_gui_width();
		var _guia = display_get_gui_height();

		var _xx = _guil/2;
		var _yy = _guia - 130;
	
		var _spr_x = sprite_get_width(spr_caixadialogo);
		var _spr_y = sprite_get_height(spr_caixadialogo);
		var _sprite = global.texto_grid[# infos.retrato,global.pagina];
		var _texto = string_copy(global.texto_grid[# infos.texto,global.pagina],0,caractere);
	
		draw_sprite_stretched(spr_caixadialogo,spr,_xx - 300,_yy - 350,_spr_x + 384,_spr_y + 384);
		draw_text_ext_color(_xx - 230,_yy - 62, _texto,32,_spr_x + 272,c,c,c,c,1);
		draw_text_color(_xx - 222,_yy - 115,global.texto_grid[# infos.nome,global.pagina],c,c,c,c,1);
	
		if global.texto_grid[# infos.retrato,global.pagina] != noone{
			draw_sprite_ext(_sprite,0,_xx - 310,_yy + 73,3,3,0,c_white,1);
		}
	}
	draw_set_font(fnt_game);
}



