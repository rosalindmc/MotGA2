#define tile

#define tileInitialize
weight = 0
rWeight = 0
g = 0
gridX = x
gridY = y
xScatter = 0
yScatter = 0
x = (gridX*metre)+(metre/2)
y = (gridY*metre)+(metre/2)
isPath = false
isRiver = false
hasPoi = false

critPath = false

image_speed = 0
image_index = irandom(20)

#define tileDraw
draw_sprite(spr_tile,image_index,x,y)
draw_sprite_ext(sprite_index,image_index,x+xScatter,y+yScatter,image_xscale,image_yscale,image_angle,c_white,image_alpha)
