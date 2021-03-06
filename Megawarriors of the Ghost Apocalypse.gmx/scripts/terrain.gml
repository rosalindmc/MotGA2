#define terrain


#define terrainInitialize
isoDepth(0)

image_index = irandom(40)
image_xscale = choose(1,-1)
image_speed = 0
mask_index = spr_mask
canReflect = false

for(i = 0; i < global.currLevel.numWaterTiles; i++)
{
    if rectangle_in_rectangle(global.currLevel.waterTiles[i].x-8,global.currLevel.waterTiles[i].y-8,global.currLevel.waterTiles[i].x+8,global.currLevel.waterTiles[i].y+8,x-20,y,x+20,y+30) != 0
    {
        canReflect = true
    }
}

#define terrainDraw
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)

#define terrainDrawReflect
if global.liveSurf = true and canReflect = true
{    
    //Draw Reflection
    if surface_exists(global.reflectSurf)
    {
        surface_set_target(global.reflectSurf)
        draw_sprite_ext(sprite_index,image_index,x-global.liveSurfX1,y-global.liveSurfY1,image_xscale,image_yscale*-1,image_angle,c_white,image_alpha)
        surface_reset_target()
    }
}