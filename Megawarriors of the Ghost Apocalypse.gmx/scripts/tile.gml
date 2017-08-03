#define tile

#define tileInitialize
weight = 0
rWeight = 0
g = 0
gridX = x
gridY = y
x = (gridX*metre)+(metre/2)
y = (gridY*metre)+(metre/2)
isPath = false
isRiver = false
hasPoi = false

critPath = false

image_speed = 0
image_index = irandom(20)

#define tileDraw
if isRiver = true
{
    draw_sprite(spr_water,image_index,x,y)
}
else
{
    draw_sprite(sprite_index,image_index,x,y)    
}
