#define tile

#define tileInitialize
weight = 0
rWeight = 0
g = 0
z = 0
wz = 0
gridX = x
gridY = y
xScatter = 0
yScatter = 0
x = (gridX*metre)+(metre/2)
y = (gridY*metre)+(metre/2)
isPath = false
isRiver = false
isWater = false
hasPoi = false
wNBorder = false
wEBorder = false
wSBorder = false
wWBorder = false
l = 0
t = 0   
w = 36
h = 36 


numAdditDood = 0
additDoodSpr[0] = spr_none
additDoodImg[0] = 0
additDoodX[0] = 0
additDoodY[0] = 0
additDoodFlip[0] = 1

critPath = false

image_speed = 0
image_index = irandom(5)

#define tileDraw
if isWater = true
{
    draw_sprite(sprite_index,image_index+floor(global.timer*5),x,y-wz)
}
else
{
    draw_sprite_part_ext(sprite_index,image_index,l,t,w,h,x-18+l,y-18+t-z,1,1,c_white,1)
}

#define tileDrawDoodads
if isWater = true
{
    if wNBorder = true
    {
        draw_sprite(spr_shore,image_index,x,y-6)
        draw_sprite_ext(spr_wave,image_index+floor(global.timer*5),x,y-7-wz,1,1,0,c_white,image_alpha)
        draw_sprite_ext(spr_edge,image_index,x,y-9,1,1,0,c_white,image_alpha)
    }
    if wEBorder = true
    {
        draw_sprite_ext(spr_wave,image_index+floor(global.timer*5),x+7,y-wz,1,1,270,c_white,image_alpha)
        draw_sprite_ext(spr_edge,image_index,x+9,y,1,1,270,c_white,image_alpha)
    }
    if wWBorder = true
    {
        draw_sprite_ext(spr_wave,image_index+floor(global.timer*5),x-7,y-wz,1,1,90,c_white,image_alpha)
        draw_sprite_ext(spr_edge,image_index,x-9,y,1,1,90,c_white,image_alpha)
    }   
    if wSBorder = true
    {
        draw_sprite_ext(spr_edge,image_index,x,y+8,1,1,0,c_white,image_alpha)
    }
}
else if (numAdditDood>0)
{
    for(var i = 0; i < numAdditDood; i++)
    {
        draw_sprite_ext(additDoodSpr[i],additDoodImg[i],x+additDoodX[i],y+additDoodY[i],additDoodFlip[i],1,0,c_white,1);
    }
}
