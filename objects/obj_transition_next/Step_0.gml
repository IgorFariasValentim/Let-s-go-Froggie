/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if global.transition == true
{
	//animacao
	img += img_spd;

	//se a img terminou
	if (img - img_num > cols)
	{
		room_goto_next();
		global.transition = false;
	}
}
else 
{
    //saindo
	img -= img_spd;
	if (img < 0) instance_destroy();
}

















