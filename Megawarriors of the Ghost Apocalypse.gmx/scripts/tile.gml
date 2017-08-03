#define tile

#define tileInitialize
weight = 0
rWeight = 0
g = 0
gridX = x
gridY = y
x = gridX*metre
y = gridY*metre
isPath = false
isRiver = false
hasPoi = false

critPath = false

image_speed = 0

#define tileDraw
draw_sprite(sprite_index,image_index,x,y)
