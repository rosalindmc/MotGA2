#define tile

#define tileInitialize
weight = 0
rWeight = 0
g = 0
z = 0
gridX = x
gridY = y
xScatter = 0
yScatter = 0
x = (gridX*metre)+(metre/2)
y = (gridY*metre)+(metre/2)
isPath = false
isRiver = false
hasPoi = false
wNBorder = false
wEBorder = false
wSBorder = false
wWBorder = false


critPath = false

image_speed = 0
image_index = irandom(20)

#define tileDraw
if isRiver = true
{
    draw_sprite(sprite_index,image_index,x,y-z)
    
    if wNBorder = true
    {
        draw_sprite(spr_shore,image_index,x,y-6)
        draw_sprite_ext(spr_wave,image_index+floor(global.timer*5),x,y-7-z,1,1,0,c_white,image_alpha)
        draw_sprite_ext(spr_edge,image_index,x,y-8,1,1,0,c_white,image_alpha)
    }
    if wEBorder = true
    {
        draw_sprite_ext(spr_wave,image_index+floor(global.timer*5),x+7,y-z,1,1,270,c_white,image_alpha)
        draw_sprite_ext(spr_edge,image_index,x+8,y,1,1,270,c_white,image_alpha)
    }
    if wWBorder = true
    {
        draw_sprite_ext(spr_wave,image_index+floor(global.timer*5),x-7,y-z,1,1,90,c_white,image_alpha)
        draw_sprite_ext(spr_edge,image_index,x-8,y,1,1,90,c_white,image_alpha)
    }   
    if wSBorder = true
    {
        draw_sprite(obj_level.floorLayout[gridX,gridY+1].sprite_index,0,x,y+16)
        draw_sprite_ext(spr_edge,image_index,x,y+8,1,1,0,c_white,image_alpha)
    }
}
else
{
    draw_sprite(spr_tile,image_index,x,y-z)
    draw_sprite_ext(sprite_index,image_index,x+xScatter,y+yScatter-z,image_xscale,image_yscale,image_angle,c_white,image_alpha)
}
