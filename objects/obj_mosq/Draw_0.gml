draw_self();

if (show_exclamation) {
    draw_sprite_ext(spr_exc,choose(0,1),x - 10 * image_xscale,y - sprite_height / 4,image_xscale,image_yscale,0,c_white,1);
}