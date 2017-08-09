#define meleeCollider



#define meleeColliderInitialize
z = 0
danger = 2

life = 0.15
image_speed = 0
animDelay = 0.05


#define meleeColliderDraw
draw_sprite_ext(sprite_index,image_index,round(x),round(y-z),image_xscale,image_yscale,image_angle,c_white,1)


#define meleeColliderStep
x = owner.x+lengthdir_x(dist,image_angle)
y = owner.y+lengthdir_y(dist,image_angle)

isoDepth(-25)

danger -= 1
animDelay -= 1/global.frameRate

if animDelay <= 0
{
    animDelay += 0.05
    image_index = min(image_index+1,2)
}

life -= 1/global.frameRate

if life <= 0
{
    instance_destroy()
}