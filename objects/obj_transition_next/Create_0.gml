/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
tamanho = sprite_get_width(spr_transicao);

camera_x = window_get_width()
camera_y = window_get_height();

cols = ceil(camera_x / tamanho);

lins = ceil(camera_y / tamanho);

//animacao
img = 0

//velocidade da animacao
img_spd = sprite_get_speed(spr_transicao) / game_get_speed(gamespeed_fps);

//total
img_num = sprite_get_number(spr_transicao) - 1;

//destino da transition
global.destino = 0;

//entrando ou saindo

global.transition = true;
















