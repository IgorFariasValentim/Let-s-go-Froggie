//transito
if global.transition_restart == true
{
	//animacao
	img += img_spd;

	//se a img terminou
	if (img - img_num > cols)
	{
		room_restart();
		global.vida = 4;
		global.transition_restart = false;
	}
}
else 
{
    //saindo
	img -= img_spd;
	if (img < 0) instance_destroy();
}

















