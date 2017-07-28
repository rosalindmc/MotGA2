#define particles

#define partBlood
dir = argument0-150+random(60)
hspd = lengthdir_x(2,dir)
vspd = lengthdir_x(2,dir)
zspd = -1+random(3)

onDeath = splat
splatDecal = spr_blood

sprite_index = spr_blood

#define partSheen
life = .50
animSpeed = 10
animDelay = 1
sprite_index = spr_sheen

#define splat
