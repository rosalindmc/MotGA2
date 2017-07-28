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

animSpeed = 10
animDelay = 1

onDeath = -4
splatDecal = spr_none
impactDeath = false

life = 10

image_angle = 0
image_speed = 0



#define particleStep
image_angle += spin/global.frameRate
moveStepParticle()
isoDepth(0)

animDelay -= animSpeed/global.frameRate

if animDelay <= 0
{
    animDelay += 1
    image_index += 1
}

life -= 1/global.frameRate

if life <= 0
{
    instance_destroy()
}

#define particleDraw
draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,image_angle,c_white,image_alpha)

#define particleDestroy
if onDeath != -4
{
    script_execute(onDeath)
}