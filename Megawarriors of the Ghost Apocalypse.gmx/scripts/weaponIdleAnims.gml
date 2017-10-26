#define weaponIdleAnims
var arg0 = argument0;

strike[argument1] = 0 
charge[argument1] = 0
animDelay[argument1] = .1
animSpeed[argument1] = 1

if greatWeapon = false
{
    meleeSwing[argument1] = 3-(argument1*2)
}
if argument1 = 1
{
    bodyTwist = 0
}

if staggered = true
{
    handHeightDest[argument1] = -5
    itemZRotDest[argument1] = -20
}

if clashing = true
{
    handDistDest[argument1] = 5+(2*clamp(-1,1,interactProgress-clashingWith.interactProgress))
    handDirDest[argument1] = (30+(-30*clamp(-1,1,interactProgress-clashingWith.interactProgress)))*meleeSwing[argument1]
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (-15)
    itemZRotDest[argument1] = 45+(-45*clamp(-1,1,interactProgress-clashingWith.interactProgress))
    
    if instance_exists(handItem[argument1])
    {
        ix = (x+clashingWith.x)/2
        iy = (y+clashingWith.y)/2
        createParticle(ix,iy,handItem[argument1].z,2,partSpark,point_direction(x,y,ix,iy)+90)
    }
    animSpeed[argument1] = 5
}

if sticking != 0
{
    handDistDest[argument1] = 5+(-5*clamp(-1,1,interactProgress-1))
    handDirDest[argument1] = 0
    handHeightDest[argument1] = (-5*clamp(-1,1,interactProgress-1))
    itemRotDest[argument1] = 0
    itemZRotDest[argument1] = 15+(15*clamp(-1,1,interactProgress-1))
    
    if instance_exists(handItem[argument1])
    {
        if sticking = 3
        {
            ix = (handItem[1].stuckIn.x)
            iy = (handItem[1].stuckIn.y)
        }
        else
        {
            ix = (handItem[sticking].stuckIn.x)
            iy = (handItem[sticking].stuckIn.y)
        }
        createParticle(ix,iy,handItem[argument1].z,25,partBlood,point_direction(x,y,ix,iy)+180)
    }
    animSpeed[argument1] = .01
}


//Adjust for the current idle anim
if handItem[argument1] = noone or (argument1 = 2 and greatWeapon = true)
{
    animIndex[argument1] = weaponIdle
}
else if altAttackKey = true
{
    animIndex[argument1] = handItem[argument1].anim[8]      
}
else
{
    animIndex[argument1] = handItem[argument1].anim[0]   
}

#define weaponIdle
var arg0 = argument0;

handDistDest[argument1] = 2
handDirDest[argument1] = 15*meleeSwing[argument1]
handHeightDest[argument1] = 0
itemRotDest[argument1] = 30*meleeSwing[argument1]
itemZRotDest[argument1] = 5*argument1
itemFlip[argument1] = 1
itemHoldAdjust[argument1] = 0

weaponIdleAnims(argument0,argument1)



#define weaponShoulderRest
var arg0 = argument0;

handDistDest[argument1] = 2
handDirDest[argument1] = 75*meleeSwing[argument1]
handHeightDest[argument1] = 0
itemRotDest[argument1] = 150*meleeSwing[argument1]
itemZRotDest[argument1] = 45
itemFlip[argument1] = 1
itemHoldAdjust[argument1] = 0

weaponIdleAnims(argument0,argument1)



#define weaponEngarde
var arg0 = argument0;

handDistDest[argument1] = 4
handDirDest[argument1] = 15*meleeSwing[argument1]
handHeightDest[argument1] = 4
itemRotDest[argument1] = 0
itemZRotDest[argument1] = 15
itemFlip[argument1] = 1
itemHoldAdjust[argument1] = 0

weaponIdleAnims(argument0,argument1)

#define weaponNinjaHold
var arg0 = argument0;

handDistDest[argument1] = 3
handDirDest[argument1] = 135*meleeSwing[argument1]
handHeightDest[argument1] = -2
itemRotDest[argument1] = 135*meleeSwing[argument1]
itemZRotDest[argument1] = -45
itemFlip[argument1] = 1
itemHoldAdjust[argument1] = 0

weaponIdleAnims(argument0,argument1)



#define weaponHalfSword
var arg0 = argument0;

handDistDest[argument1] = 4
handDirDest[argument1] = 15*meleeSwing[argument1]
handHeightDest[argument1] = 4
itemRotDest[argument1] = 0
itemZRotDest[argument1] = 15
itemFlip[argument1] = 1
itemHoldAdjust[argument1] = -handItem[argument1].holdPoint

weaponIdleAnims(argument0,argument1)


#define weaponReverseKnife
var arg0 = argument0;

handDistDest[argument1] = 3
handDirDest[argument1] = 90*meleeSwing[argument1]
handHeightDest[argument1] = -2
itemRotDest[argument1] = 135*meleeSwing[argument1]
itemZRotDest[argument1] = 0
itemFlip[argument1] = 1
itemHoldAdjust[argument1] = 0

weaponIdleAnims(argument0,argument1)