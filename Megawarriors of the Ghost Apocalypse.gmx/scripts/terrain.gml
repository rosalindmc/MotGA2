#define terrain


#define terrainInitialize
isoDepth(0)

image_index = irandom(40)
image_xscale = choose(1,-1)
image_speed = 0
mask_index = spr_mask

#define terrainDraw
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)

if global.liveSurf = true
{    
    //Draw Reflection
    if surface_exists(global.reflectSurf)
    {
        surface_set_target(global.reflectSurf)
        draw_sprite_ext(sprite_index,image_index,x-global.liveSurfX1,y-global.liveSurfY1,image_xscale,image_yscale*-1,image_angle,c_white,image_alpha)
        surface_reset_target()
    }
}