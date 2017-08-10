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
onDeath = splat
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
image_alpha = random(.3)

i = 1+random(1)

dir = random(360)

hspd = lengthdir_x(i,dir)
vspd = lengthdir_x(i,dir)
zspd = -1+random(3)
gravMult = 1

impactDeath = true
onDeath = splat
splatDecal = spr_waterSplat

sprite_index = spr_splash

#define partSheen
life = .50
animSpeed = 10
animDelay = 1
sprite_index = spr_sheen

#define splat
surface_set_target(global.decalSurf)
draw_sprite_ext(splatDecal,random(100),x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)    
surface_reset_target()