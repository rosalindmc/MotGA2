#define damageChar
t = argument0
p = 0

//Damage
if (dmgType > 4){
    p = (dmg)*(min(1-((t.armour-(pen))/100),1))
    if owner.physicalResist+owner.damageResist[dmgType] > 0
    {p /= 1+owner.physicalResist+owner.damageResist[dmgType]}
    else
    {p *= 1+abs(owner.physicalResist+owner.damageResist[dmgType])}   
}
else{
    p = dmg
    if owner.magicResist+owner.damageResist[dmgType] > 0
    {p /= 1+owner.magicResist+owner.damageResist[dmgType]}
    else
    {p *= 1+abs(owner.magicResist+owner.damageResist[dmgType])}
}

p = max(0,floor(p+random(.99)))
t.life -= p

i = instance_create(t.x,t.y,obj_text)
i.z = t.z+(metre*2)
i.t = p
if p = 0
{
    i.t = 'No Damage'
}

if sweetSpot = true
{
    i.c2 = c_yellow
}
else if min(1-((t.armour-(pen))/100),1) <= .8
{
    i.c2 = c_gray
}

 //Temp Apply Bleed
if dmgType != dmgType.impact and irandom(5) < p
{
    applyStatus(t,bleed,1,6)
}

//Dif damage types might have dif particles later
createParticle(t.x,t.y,z,floor(p*5),partBlood,point_direction(originX,originY,t.x,t.y))

//Impact
t.hspd += lengthdir_x(power(impact,.8),point_direction(originX,originY,t.x,t.y))/t.weight
t.vspd += lengthdir_y(power(impact,.8),point_direction(originX,originY,t.x,t.y))/t.weight
t.stability -= 3+(impact/2)
t.stabilityDelay = 1

if t.stability <= 0
{
    applyStatus(t,stun,1,3+abs(t.stability/5))
    t.stability = t.stabilityMax
}

//Stagger
t.canMove = false
t.moveTimer += .5

with(t)
{
    if abs(angle_difference(other.image_angle,facing)) < 90
    {
        animationStart(humanoidFlinchForward,0)
    }
    else
    {
        animationStart(humanoidFlinchBackward,0)
    }
}

//Shake
if owner.player = true or t.player = true
{
    obj_control.shake += impact
}

//Check Death
if t.life <= 0
{
    killChar(t)
}


#define killChar
with(argument0)
{
    alive = false
    animationStart(humanoidDie,0)
    animationReset(1)
    animationReset(2)
    
    
    
    for(i = 0; i < inventorySize; i++)
    {
        if (inventory[i] != noone){
            inventory[i].owner = noone
            ii = instance_create(x,y,obj_interactable)
            ii.owner = inventory[i]
            ii.name = inventory[i].name
            ii.useType = pickUp
            inventory[i].interactId = ii
            inventory[i] = noone    
        }
    }
    
    
    if(!player){
        aiDestroy()
        //Later Add check that player was near kill
        gainExperience(xpReward)
    }
    
    if (id == global.pc.autoTarget){
    global.pc.autoTarget = noone;
    }
    
    //mask_index = spr_none
}

#define gainExperience
p = round(argument0*global.pc.xpMult)

i = instance_create(global.pc.x,global.pc.y,obj_text)
i.z = (metre*2)
i.t = '+'+string_format(p,0,1)+' XP'
i.c1 = c_black
i.c2 = c_purple

global.pc.xp += p

if global.pc.xp > global.pc.xpToLevel
{
global.pc.xp -= global.pc.xpToLevel
global.pc.xpToLevel *= 1.4
global.pc.combatLevel += 1
global.pc.talentPoints += 1

i = instance_create(global.pc.x,global.pc.y,obj_text)
i.z = (metre*3)
i.t = 'LEVEL UP'
i.c1 = c_purple
i.c2 = c_white
}

