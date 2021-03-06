#define particle

#define createParticle
//Create particles (x,y,z,#,type,spec)

repeat(argument3)
{
    i = instance_create(argument0, argument1, obj_particle)
    i.z = argument2
    with(i)
    {
        script_execute(argument4,argument5)
    }
}

#define particleInitialize
dir = 0

z = 0
zspd = 0
hspd = 0
vspd = 0
gravMult = 0

spin = 0
floorZ = 0
growth = 0
bounciness = 0
fade = 0

animSpeed = 10
animDelay = 1

onDeath = -4
onUpdate = -4
updateDelay = 1
splatDecal = spr_none
impactDeath = false

reflectOnly = false
life = 10

col1 = c_white
col2 = c_white
spr2 = spr_none
img2 = spr_none

image_angle = 0
image_speed = 0



#define particleStep
image_angle += spin/global.frameRate
image_xscale += growth/global.frameRate
image_yscale += growth/global.frameRate
image_alpha -= fade/global.frameRate

moveStepParticle()
isoDepth(0)

animDelay -= animSpeed/global.frameRate

if animDelay <= 0
{
    animDelay += 1
    image_index += 1
}

if onUpdate != -4
{
    updateDelay -= updateSpeed/global.frameRate
    if updateDelay <= 0
    {
        updateDelay += 1
        script_execute(onUpdate)
    }
}

life -= 1/global.frameRate

if life <= 0
{
    instance_destroy()
}

#define particleDraw
if reflectOnly = false
{
    draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,image_angle,col1,image_alpha)
    draw_sprite_ext(spr2,img2,x,y-z,image_xscale,image_yscale,image_angle,col2,image_alpha)
}


#define particleDestroy
if onDeath != -4
{
    script_execute(onDeath)
}
#define particleDrawReflection
if reflectOnly = true
{
    if surface_exists(global.reflectSurf)
    {
        surface_set_target(global.reflectSurf)
        draw_sprite_ext(sprite_index,image_index,x-global.liveSurfX1,y-global.liveSurfY1-z,image_xscale,image_yscale,image_angle,c_white,image_alpha)
        surface_reset_target()
    }    
}