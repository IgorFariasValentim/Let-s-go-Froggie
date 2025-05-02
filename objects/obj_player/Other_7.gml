//Fim das animações

//Vai voltar para a animação de idle dps do ataque
if (sprite_index == spr_playeratack){
	//Se a o quadro atual for maior que a quantidade de quadros menos um
	if (image_index > image_number - 1){
		sprite_index = spr_playeridle;
	}
}