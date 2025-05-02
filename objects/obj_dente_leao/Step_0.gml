/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if instance_place(x,y,obj_player) desaparece = true;

if desaparece == true{
	part_type_shape(global.particle3,pt_shape_pixel);
	part_type_orientation(global.particle3,0,-90,0,0,0);
	part_type_speed(global.particle3,0,-0.50,0,0);
	part_type_life(global.particle3,10,20);
	part_particles_create(global.p_system,obj_dente_leao.x,obj_dente_leao.y,global.particle3,4);

	image_alpha -= 0.03

	if image_alpha < 0
	{
		instance_destroy();
	}
}

























