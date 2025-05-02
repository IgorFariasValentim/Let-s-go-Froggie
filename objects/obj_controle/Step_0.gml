global.vida = clamp(global.vida,0,global.vida_max);
if instance_exists(obj_dialogo)
{
	global.dialogo = true;
}
else 
{
	global.dialogo = false;
}

var _numslots = gamepad_get_device_count();

for(var _i = 0;_i < _numslots;_i++){
	if(gamepad_is_connected(_i)){
		global.gamepad = _i;
	}
}
var R = keyboard_check_pressed(ord("R"))

if (R) room_restart();
//if (global.vida <= 0){
//	audio_stop_sound(snd_musicafase1);
//}






















