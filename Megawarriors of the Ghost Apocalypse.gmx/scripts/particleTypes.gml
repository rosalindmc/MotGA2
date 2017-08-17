#define particleTypes


#define partBlood
i = 1+random(1)

image_xscale = i
image_yscale = i
image_angle = random(359)

i = 2+random(6)

dir = argument0-120+random(240)

hspd = lengthdir_x(i,dir)
vspd = lengthdir_x(i,dir)
zspd = -1+random(5)
gravMult = 1

impactDeath = true
onDeath = bloodSplat
splatDecal = spr_bloodSplat

sprite_index = spr_blood

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
vspd = lengthdir_x(i,dir)
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
    draw_sprite_ext(splatDecal,random(100),x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)    
    surface_reset_target()
}
else
{
    createParticle(x,y,z,5,partBloodyWater,image_xscale)
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

i = random(1)

dir = random(359)
spin = random(90)*choose(-1,1)

hspd = lengthdir_x(i,dir)
vspd = lengthdir_x(i,dir)
animSpeed = 0

growth = random(1)
fade = .1
reflectOnly = true
sprite_index = spr_bloodSplat
