#define particleTypes


#define partBlood
i = 1+random(1)

image_xscale = i
image_yscale = i
image_angle = random(359)

i = 2+random(6)

dir = argument0-60+random(120)

hspd = lengthdir_x(i,dir)
vspd = lengthdir_y(i,dir)
zspd = -1+random(8)
gravMult = 1

impactDeath = true
onDeath = bloodSplat
splatDecal = spr_bloodSplat

sprite_index = spr_blood

#define partSpark
i = random(1.5)

image_xscale = i
image_yscale = i
image_angle = random(359)

i = 2+random(6)

dir = argument0-60+random(120)

hspd = lengthdir_x(i,dir)
vspd = lengthdir_y(i,dir)
zspd = -1+random(10)
gravMult = 1
bounciness = .75
life = .5
fade = 1

impactDeath = false
sprite_index = spr_spark

#define partDust
life = .25
animSpeed = 20
animDelay = 1
image_xscale = argument0
sprite_index = spr_dust

#define partSplash
i = 2+random(3)

image_xscale = i
image_yscale = i
image_angle = random(359)
image_alpha = random(1)

i = 1+random(1)

dir = random(360)

hspd = lengthdir_x(i,dir)
vspd = lengthdir_y(i,dir)
zspd = -1+random(3)
gravMult = 1
spin = random(360)*choose(-1,1)

impactDeath = true
onDeath = splat
splatDecal = spr_waterSplat

sprite_index = spr_splash

#define partRipple
life = .50
animSpeed = 20
animDelay = 1
sprite_index = spr_ripple
reflectOnly = true
image_alpha = 1


#define partSheen
life = .50
animSpeed = 10
animDelay = 1
sprite_index = spr_sheen

#define bloodSplat
if floorID.isRiver = false
{
    surface_set_target(global.decalSurf)
    draw_sprite_ext(splatDecal,random(100),x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha*(.3+random(.4)))    
    surface_reset_target()
}
else
{
    createParticle(x,y,z,1+irandom(2),partBloodyWater,image_xscale)
}

#define gibSplat
if floorID.isRiver = false
{
    surface_set_target(global.decalSurf)
    draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,col1,image_alpha)
    draw_sprite_ext(spr2,img2,x,y,image_xscale,image_yscale,image_angle,col2,image_alpha)
    surface_reset_target()
    createParticle(x,y,z+3,3,partBlood,point_direction(hspd,vspd,0,0))
}
else
{   
    createParticle(x,y,z,3,partBloodyWater,random(2))
    createParticle(x,y,z,3,partSplash,random(2))
}

#define splat
if floorID.isRiver = false
{
    surface_set_target(global.decalSurf)
    draw_sprite_ext(splatDecal,random(100),x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)    
    surface_reset_target()
}

#define partBloodyWater
life = 10

i = argument0

image_xscale = i
image_yscale = i
image_angle = random(359)
image_index = random(100)

i = random(1)

dir = random(359)
spin = random(90)*choose(-1,1)

hspd = lengthdir_x(i,dir)
vspd = lengthdir_y(i,dir)
animSpeed = 0

growth = random(1)
fade = .1
reflectOnly = true
sprite_index = spr_bloodSplat

#define partGib
dir = argument0-60+random(120)
i = 4+random(4)

hspd = lengthdir_x(i,dir)
vspd = lengthdir_y(i,dir)
zspd = 3+random(7)
gravMult = 1

spin = random(90)*choose(1,-1)

impactDeath = true
onDeath = gibSplat
onUpdate = bloodDrip
updateSpeed = 10

#define partBone
dir = argument0-60+random(120)
i = 4+random(4)

hspd = lengthdir_x(i,dir)
vspd = lengthdir_y(i,dir)
zspd = 3+random(7)
gravMult = 1

spin = random(180)*choose(1,-1)

sprite_index = spr_boneShard

impactDeath = true
onDeath = splat
splatDecal = spr_boneShard
#define bloodDrip
createParticle(x,y,z,5,partBlood,point_direction(hspd,vspd,0,0))