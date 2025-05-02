//moedas
draw_set_font(fnt_game);
draw_sprite_stretched(spr_emblemamoeda,0,130,160,64,64);

draw_text_transformed(173,182,"x",.8,.8,0);
draw_text_transformed(186,168,global.moedas,1.4,1.4,0);

draw_text_transformed(185,93,global.qtd_municao,.8,.8,0);

draw_text_transformed(185,115,global.lvl,.8,.8,0);

draw_sprite_stretched(spr_armaslots,0,133,-5,256,256);
draw_set_font(fnt_game);