xx = display_get_gui_width() / 3 + 200;
yy = lerp(yy,y1,0.2);

var xl = 200;

var c = c_black;
var _c = c_dkgrey;
var _lista = global.lista_itens;



draw_sprite_ext(spr_inventario,pags, xx, yy,5,5,0,c_white,1);

//itens
draw_sprite_ext(spr_caixa_text,0, xx - xl, yy + 150,2,2,0,c_white,1);
draw_text_transformed_color(xx - xl - 50, yy + 160, "Itens",2,2,0,_c,_c,_c,_c,1);

//emblemas
draw_sprite_ext(spr_caixa_text,0,xx - xl,yy + 290,2,2,0,c_white,1);
draw_text_transformed_color(xx - xl - 110,yy + 300,"Emblemas",2,2,0,_c,_c,_c,_c,1);

if pags >= 1{
	
	var slotsx = xx + comecox;
	var slotsy = yy + comecoy;
	var x_text = 60;
	var _sep   = sep;
	
	switch(pags){
		case 1:
			if selecao == false{
				draw_sprite_ext(spr_ops_menus,3,xx - xl + 200,yy + 195,4,4,0,c_white,1);
			}
			
			for (var i = 0; i < array_length(_inv); i++){
				
				if selecao == true && global.item_select != -1{
					draw_sprite_ext(spr_ops_menus,3, slotsx + 200, slotsy + 35 + _sep*global.item_select,4,4,0,c_white,1);
				}
				
				draw_sprite_ext(_inv[i]._sprite, _inv[i]._subimg, slotsx, slotsy + _sep*i ,2.4,2.4,0,c_white,1);
				draw_text_transformed_color(slotsx + x_text, slotsy + _sep*i ,_inv[i]._nome,1.2,1.2,0,c,c,c,c,1);
				
				if global.item_select == i{
					draw_text_ext_transformed_color(slotsx, slotsy + 415,_inv[i]._desc,24,304,1,1,0,c,c,c,c,1);
				}
			}
			
		break;
	
		case 2:
			if selecao == false{
				draw_sprite_ext(spr_ops_menus,3,xx - xl + 200,yy + 335,4,4,0,c_white,1);
			}
		break;
	}
}
