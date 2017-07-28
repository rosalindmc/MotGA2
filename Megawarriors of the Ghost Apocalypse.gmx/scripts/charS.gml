/*
if hp > hpMax
{
    hp = hpMax
}

if spDelay = 0
{
    sp = min(spMax,sp+(spRegen/global.frameRate))
}
else
{
    spDelay = max(0,spDelay-(1/global.frameRate))
}

if pc = true
{
    fire = min(100,fire+(2/global.frameRate))
}

if canAttack = true
{
    kick = max(0,kick-(10/global.frameRate))
}

kick = min(10,kick)

if hp <= 0
{
    if pc = true
    {
        room_speed = global.frameRate/2
        obj_control.black += .5/global.frameRate
        canMove = false
        canAttack = false
        
        if vis = true
        {
        obj_control.black = 0
        i = instance_create(x,y,obj_corpse)
        i.hspd = hspd
        i.vspd = vspd
        i.zspd = zspd
        i.facingH = facingH
        i.facingV = facingV
        with(i){scr_humanoid(0)}
        i.charSprite = charSprite
        i.anim[0] = scr_humanoidDeath
        i.anim[1] = scr_swordIdle
        i.alarm[0] = 1
        i.alarm[1] = -4
        
        vis = false
            if instance_exists(invSlot[invSelect])
            {
                with(invSlot[invSelect])
                {
                scr_dropItem()
                }
            }
        }
    }
    else
    {
        audio_play_sound(deathSound,0,false)
    
        i = instance_create(x,y,obj_corpse)
        i.hspd = hspd
        i.vspd = vspd
        i.zspd = zspd
        i.facingH = facingH
        i.facingV = facingV
        with(i){scr_humanoid(0)}
        i.charSprite = charSprite
        i.anim[0] = scr_humanoidDeath
        i.alarm[0] = 1

        repeat(arrows)
        {
            instance_create(x-5+random(10),y-5+random(10),obj_arrowPickup)
        }
        
        instance_destroy()
        

    }
}

//Set Terrain to whatever the Grid Tile is (add exception for spots)
dTerrain = grid.difficult
