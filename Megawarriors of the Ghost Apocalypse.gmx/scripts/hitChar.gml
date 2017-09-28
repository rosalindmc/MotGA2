#define hitChar
t = argument0

//Damage
p = (dmg)*(min(1-((t.armour-(pen))/100),1))
damageChar(t,p,dmgType,visNumbers,owner)

//Modify The Text pop up for crits and failed armour pen
if visNumbers = true
{   
    if owner.sweetSpot = true
    {
        i.c2 = c_yellow
    }
    else if min(1-((t.armour-(pen))/100),1) <= .8
    {
        i.c2 = c_gray
    }
}

//Impact
impactChar(t,impact,point_direction(originX,originY,t.x,t.y),1,owner)

//Apply Bleed
if dmgType != dmgType.impact and irandom(5) < p
{
    applyStatus(t,bleed,1,6,owner)
}

//Dif damage types might have dif particles later
if image_index = spr_slash
{
    createParticle(t.x,t.y,z,floor(p*5),partBlood,image_angle-(90*image_yscale))
}
else
{
    createParticle(t.x,t.y,z,floor(p*5),partBlood,point_direction(originX,originY,t.x,t.y))
}

//Shake
if owner.player = true
{
    obj_control.shake += impact
}

#define damageChar
//dmageChar(target,damage,type,dmgtext,damager)

p = argument1
attacker = argument4    //use later to do procs/on kill effects etc

//Damage
if (argument2 < 7){   
    if argument0.physicalResist+argument0.damageResist[argument2] > 0
    {p /= 1+argument0.physicalResist+argument0.damageResist[argument2]}
    else
    {p *= 1+abs(argument0.physicalResist+argument0.damageResist[argument2])}   
}
else{
    if argument0.magicResist+argument0.damageResist[argument2] > 0
    {p /= 1+argument0.magicResist+argument0.damageResist[argument2]}
    else
    {p *= 1+abs(argument0.magicResist+argument0.damageResist[argument2])}
}

p = max(0,floor(p+random(.99)))
argument0.life -= p

if argument3 = true
{
    i = instance_create(argument0.x,argument0.y,obj_text)
    i.z = argument0.z+(metre*2)
    i.t = p
      
    if p = 0
    {
        i.t = ''
    }
}

if argument0.life <= 0
{
    killChar(argument0)
    
    p += choose(0,0,0,1,1,2,2,3)
    with(argument0)
    {
        if other.p > lifeMax
        {
            gibLegs(argument2)
        }
        else if other.p > vitality*1.5
        {
            gibHead(argument2)
        }
        else if other.p > vitality
        {
            gibArm(argument2,choose(1,2))
        }
    }
    
}


#define impactChar
//Eventually Add z dir to impact
//type 0 z is a knockback, behaves as coded below
//type 1 z is a knockdown, if stability is reduced to 0 the target is proned
//type 2 z is a punt, target is given upwards z speed and can't move again until grounded
//stability reduced to 0 and they will be proned upon landing
t = argument0
impact = argument1
dir = argument2
punt = argument3

t.hspd += (lengthdir_x(power(2+impact,.9),dir)/t.weight)*punt
t.vspd += (lengthdir_y(power(2+impact,.9),dir)/t.weight)*punt
t.stability -= 3+(impact/2)
t.stabilityDelay = 1

if impact > 5
{
    t.dangerous = true
    t.launcher = argument4
}

if t.stability <= 0 and t.alive = true
{
    applyStatus(t,stun,1,3+abs(t.stability/5),argument4)
    t.stability = t.stabilityMax
}

if t.life > 0
{
    //Stagger
    t.canMove = false
    t.moveTimer += .5
    
    with(t)
    {
        if abs(angle_difference(other.dir,facing)) < 90
        {
            animationStart(humanoidFlinchForward,0)
        }
        else
        {
            animationStart(humanoidFlinchBackward,0)
        }
    }
}

//Shake
if t.player = true
{
    obj_control.shake += impact
}

//End Clashes
if t.clashing = true
{
    with(t)
    {
        endClash()
    }
}

#define killChar
with(argument0)
{
    if(!player and alive = true)
    {
        aiDestroy()
        //Later Add check that player was near kill
        gainExperience(xpReward)
    }
    
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