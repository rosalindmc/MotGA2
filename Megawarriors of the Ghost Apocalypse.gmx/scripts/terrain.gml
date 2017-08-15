#define terrain

#define terrainInitialize
isoDepth(0)

image_index = irandom(40)
image_speed = 0
mask_index = spr_largeMask

#define terrainDraw
draw_sprite(sprite_index,image_index,x,y)
