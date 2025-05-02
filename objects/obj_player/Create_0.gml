//Variaveis player

var _cam = instance_create_layer(x,y,"camera",obj_camera);

//movimentacao
hspd = 0;
vspd = 0;
vspd_min = -8;
vspd_max = 8;
grav = 0.3;
jump_height = 8;
alpha = 1;

//coyote time
coyote_time = 0
coyote_time_max = 10;

jump_max = 1;
jump_cont = jump_max;
aterr = 0;
time_walljump = 0;

//aceleracao e desaceleracao
dir = 0;
spd = 0;
spd_max = 2.8;
run_time = 60;
acc = 0.2;
dcc = 0.2;
can_move = 0;

//dash
global.pode_dash = true;
dash = true;
dash_delay = 60;
dash_force = 9;
dash_time = 0;
dash_distance = 11;

//escala
x_scale = 1;
y_scale = 1;

global.particle1 = part_type_create();

state = player_state_free;

global.abriubau = 0;
global.dano = 0.5;
global.dano1 = 1;

dir_dano = 0;
dano_force = 0;
dano_time = 0;

danov_force = -5;
danov_time = 5;
danov_dir = 0;

time_morre = 0;

piscar = 1;
time_piscar = 0;

aterrissou = 0;

dir_dash = 0;

dash_v_count = 0;

f = false;

global.estado = "";

//ataque
ataque = false;
time_atack = 30;

//veneno
time_veneno = 180;
veneno = false;
color_veveno = c_aqua;
alpha_veneno = 0;
invencivel = false;

