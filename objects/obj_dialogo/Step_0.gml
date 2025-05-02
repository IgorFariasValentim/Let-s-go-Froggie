if iniciar == false
{
	scr_dialogo();
	iniciar = true;
}

var _interact = keyboard_check_pressed(ord("C")) or gamepad_button_check_pressed(0,gp_face2);

if _interact and global.dialogo == true
{
	if caractere < string_length(global.texto_grid[# infos.texto,global.pagina])
	{
		caractere = string_length(global.texto_grid[# infos.texto,global.pagina])
	}
	else
	{
		alarm[0] = 2;
		caractere = 0;
		
		if global.pagina < ds_grid_height(global.texto_grid) - 1
		{
			global.pagina++;
		}
		else
		{
			v1 = 0;
			v2 = 671;
		}
		if global.pagina == ds_grid_height(global.texto_grid) - 1 spr = random_range(1,2);
	}
}
if (b2 > 670) instance_destroy();