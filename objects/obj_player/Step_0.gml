/// description Inserir descrição aqui
// Você pode escrever seu código neste editor

state();

//x_scale = approach(x_scale,1,0.05);
//y_scale = approach(y_scale,1,0.05);

#region parallax
var _arvores1 = layer_get_id("arv_1");
var _arvores2 = layer_get_id("arv_2");
var _fundotile = layer_get_id("tl_terrenoparallax");
var _fundocena = layer_get_id("parallaxcena");


layer_x(_arvores1,lerp(0, camera_get_view_x(view_camera[VIEW]),0.6));
layer_x(_arvores2,lerp(0, camera_get_view_x(view_camera[VIEW]),0.7));
layer_x(_fundocena,lerp(0, camera_get_view_x(view_camera[VIEW]),0.2));
layer_x(_fundotile,lerp(0, camera_get_view_x(view_camera[VIEW]),0.2));
#endregion


















