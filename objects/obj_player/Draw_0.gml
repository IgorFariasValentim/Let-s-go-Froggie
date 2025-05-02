draw_sprite_ext(sprite_index, image_index,x,y,x_scale, y_scale,0, image_blend,image_alpha);

#region Efeito Veneno
if (veneno) {
	alpha_veneno = lerp(alpha_veneno,0.3,0.1);
}else alpha_veneno = lerp(alpha_veneno,0,0.1);

if alpha_veneno > 0 {
	gpu_set_fog(true,color_veveno,0,0);
		draw_sprite_ext(sprite_index,image_index,x,y,x_scale,y_scale,0,image_blend,alpha_veneno);
	gpu_set_fog(false,color_veveno,0,0);
}

#endregion






