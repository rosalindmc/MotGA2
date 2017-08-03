#define weaponAttackAnims


#define weaponIdle
animDelay[argument1] = 1
animSpeed[argument1] = 1

handDistDest[argument1] = 2
handDirDest[argument1] = ((60*greatWeapon)+15)*meleeSwing[argument1]
handHeightDest[argument1] = 0
itemRotDest[argument1] = ((120*greatWeapon)+30)*meleeSwing[argument1]

if greatWeapon = false
{
    meleeSwing[argument1] = 3-(argument1*2)
}

if argument1 = 1
{
    bodyTwist = 0
}

#define weaponSlashHold
s = 1/(handItem[argument1].meleeRateMult[queuedAnim[argument1]]*handItem[argument1].meleeRate*(1+((greatWeapon*handItem[argument1].gwRateMult)-greatWeapon)))

switch(argument0)
{
    case 0:    
    handDistDest[argument1] = 2
    handDirDest[argument1] = (45*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (120*meleeSwing[argument1])
    animDelay[argument1] = .1*s
    break

    case 1:
    handDistDest[argument1] = 2
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (150*meleeSwing[argument1])
    animDelay[argument1] = .3*s
    break

    case 2:
    handDistDest[argument1] = 2
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (225*meleeSwing[argument1])
    animDelay[argument1] = .3*s
    
    if greatWeapon = true
    {
        bodyTwist = meleeSwing[argument1]
    }
    break
    
    case 3:
    handDistDest[argument1] = 2
    handDirDest[argument1] = (150*meleeSwing[argument1])
    handHeightDest[argument1] = 5
    itemRotDest[argument1] = (225*meleeSwing[argument1])
    animDelay[argument1] = .3
    
    charge[argument1] = 2
    if queuedAnim[argument1] = 1
    {
        queuedAnim[argument1] = 2
    }

    sweetSpot = true
    perfectHitSheen(argument1)
    break
    
    case 4:
    handDistDest[argument1] = 2
    handDirDest[argument1] = (150*meleeSwing[argument1])
    handHeightDest[argument1] = 5
    itemRotDest[argument1] = (240*meleeSwing[argument1])
    animDelay[argument1] = 1*s
    
    sweetSpot = false
    break
    
    case 5:
    meleeAttack(argument1)
    break
}



#define weaponSlash
s = 1/(handItem[argument1].meleeRateMult[queuedAnim[argument1]]*handItem[argument1].meleeRate*(1+((greatWeapon*handItem[argument1].gwRateMult)-greatWeapon)))

switch(argument0)
{
    case 0:
    handDistDest[argument1] = 4
    handDirDest[argument1] = (90*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (120*meleeSwing[argument1])
    animDelay[argument1] = .03*s
    if greatWeapon = true
    {
        bodyTwist = 0
    }
    break

    case 1:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (45*meleeSwing[argument1])
    handHeightDest[argument1] = 3
    itemRotDest[argument1] = (60*meleeSwing[argument1])
    animDelay[argument1] = .03*s
    break
    
    case 2:
    handDistDest[argument1] = 12
    handDirDest[argument1] = (-15*meleeSwing[argument1])
    handHeightDest[argument1] = 2
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    animDelay[argument1] = .04*s
    break
    
    case 3:
    //HIT
    meleeHit(argument1,queuedAnim[argument1])
    
    handDistDest[argument1] = 10
    handDirDest[argument1] = (-45*meleeSwing[argument1])
    handHeightDest[argument1] = 1
    itemRotDest[argument1] = (-60*meleeSwing[argument1])
    animDelay[argument1] = .1*s
    break
    
    case 4:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (-60*meleeSwing[argument1])
    handHeightDest[argument1] = 1
    itemRotDest[argument1] = (-75*meleeSwing[argument1])
    animDelay[argument1] = .1*s
    
    if greatWeapon = true
    {
        bodyTwist = -meleeSwing[argument1]
    }
    break
    
    case 5:
    handDistDest[argument1] = 6
    handDirDest[argument1] = (-60*meleeSwing[argument1])
    handHeightDest[argument1] = 0
    itemRotDest[argument1] = (-75*meleeSwing[argument1])
    animDelay[argument1] = .3
    sweetSpot = true
    perfectHitSheen(argument1)
    break
    
    case 6:
    handDistDest[argument1] = 6
    handDirDest[argument1] = (-60*meleeSwing[argument1])
    handHeightDest[argument1] = 0
    itemRotDest[argument1] = (-75*meleeSwing[argument1])
    animDelay[argument1] = .2*s
    sweetSpot = false
    break
    
    case 7:
    meleeEnd(argument1)
    break
}

#define weaponStabHold
s = 1/(handItem[argument1].meleeRateMult[queuedAnim[argument1]]*handItem[argument1].meleeRate*(1+((greatWeapon*handItem[argument1].gwRateMult)-greatWeapon)))

switch(argument0)
{
    case 0:    
    meleeSwing[argument1] = 3-(argument1*2)
    
    handDistDest[argument1] = 4
    handDirDest[argument1] = (90*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (45*meleeSwing[argument1])
    animDelay[argument1] = .1*s
    break

    case 1:
    handDistDest[argument1] = 3
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 3
    itemRotDest[argument1] = (15*meleeSwing[argument1])
    animDelay[argument1] = .3*s
    break

    case 2:
    handDistDest[argument1] = 2
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 2
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    animDelay[argument1] = .3*s
    break
    
    case 3:
    handDistDest[argument1] = 3
    handDirDest[argument1] = (150*meleeSwing[argument1])
    handHeightDest[argument1] = 1
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    animDelay[argument1] = .3
    
    charge[argument1] = 2
    if queuedAnim[argument1] = 1
    {
        queuedAnim[argument1] = 2
    }
    sweetSpot = true
    perfectHitSheen(argument1)
    break
    
    case 4:
    handDistDest[argument1] = 4
    handDirDest[argument1] = (150*meleeSwing[argument1])
    handHeightDest[argument1] = 0
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    animDelay[argument1] = 1*s
    
    sweetSpot = false
    break
    
    case 5:
    meleeAttack(argument1)
    break
}



#define weaponStab
s = 1/(handItem[argument1].meleeRateMult[queuedAnim[argument1]]*handItem[argument1].meleeRate*(1+((greatWeapon*handItem[argument1].gwRateMult)-greatWeapon)))

switch(argument0)
{
    case 0:
    handDistDest[argument1] = 2
    handDirDest[argument1] = (45*meleeSwing[argument1])
    handHeightDest[argument1] = 2
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    animDelay[argument1] = .03*s
    break

    case 1:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (15*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    animDelay[argument1] = .03*s
    break
    
    case 2:
    handDistDest[argument1] = 16
    handDirDest[argument1] = (0*meleeSwing[argument1])
    handHeightDest[argument1] = 6
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    animDelay[argument1] = .04*s
    break
    
    case 3:
    //HIT
    meleeHit(argument1,queuedAnim[argument1])
    
    handDistDest[argument1] = 12
    handDirDest[argument1] = (0*meleeSwing[argument1])
    handHeightDest[argument1] = 6
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    animDelay[argument1] = .1*s
    break
    
    case 4:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (15*meleeSwing[argument1])
    handHeightDest[argument1] = 5
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    animDelay[argument1] = .1*s
    break
    
    case 5:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (30*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (15*meleeSwing[argument1])
    animDelay[argument1] = .3
    sweetSpot = true
    perfectHitSheen(argument1)
    break
    
    case 6:
    handDistDest[argument1] = 6
    handDirDest[argument1] = (30*meleeSwing[argument1])
    handHeightDest[argument1] = 3
    itemRotDest[argument1] = (30*meleeSwing[argument1])
    animDelay[argument1] = .2*s
    sweetSpot = false
    break
    
    case 7:
    meleeEnd(argument1)
    break
}

#define weaponHiltHold
s = 1/(handItem[argument1].meleeRateMult[queuedAnim[argument1]]*handItem[argument1].meleeRate*(1+((greatWeapon*handItem[argument1].gwRateMult)-greatWeapon)))

switch(argument0)
{
    case 0:    
    meleeSwing[argument1] = 3-(argument1*2)
    handDistDest[argument1] = 4
    handDirDest[argument1] = (90*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (135*meleeSwing[argument1])
    animDelay[argument1] = .1*s
    break

    case 1:
    handDistDest[argument1] = 4
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (150*meleeSwing[argument1])
    animDelay[argument1] = .3*s
    break

    case 2:
    handDistDest[argument1] = 4
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (225*meleeSwing[argument1])
    animDelay[argument1] = .3*s
    break
    
    case 3:
    handDistDest[argument1] = 4
    handDirDest[argument1] = (150*meleeSwing[argument1])
    handHeightDest[argument1] = 5
    itemRotDest[argument1] = (225*meleeSwing[argument1])
    animDelay[argument1] = .3
    
    charge[argument1] = 2
    if queuedAnim[argument1] = 1
    {
        queuedAnim[argument1] = 2
    }
    sweetSpot = true
    perfectHitSheen(argument1)
    break
    
    case 4:
    handDistDest[argument1] = 4
    handDirDest[argument1] = (150*meleeSwing[argument1])
    handHeightDest[argument1] = 5
    itemRotDest[argument1] = (240*meleeSwing[argument1])
    animDelay[argument1] = 1*s
    
    sweetSpot = false
    break
    
    case 5:
    meleeAttack(argument1)
    break
}



#define weaponHilt
s = 1/(handItem[argument1].meleeRateMult[queuedAnim[argument1]]*handItem[argument1].meleeRate*(1+((greatWeapon*handItem[argument1].gwRateMult)-greatWeapon)))

switch(argument0)
{
    case 0:
    handDistDest[argument1] = 2
    handDirDest[argument1] = (45*meleeSwing[argument1])
    handHeightDest[argument1] = 2
    itemRotDest[argument1] = (240*meleeSwing[argument1])
    animDelay[argument1] = .03*s
    break

    case 1:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (15*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (225*meleeSwing[argument1])
    animDelay[argument1] = .03*s
    break
    
    case 2:
    handDistDest[argument1] = 16
    handDirDest[argument1] = (0*meleeSwing[argument1])
    handHeightDest[argument1] = 6
    itemRotDest[argument1] = (195*meleeSwing[argument1])
    animDelay[argument1] = .04*s
    break
    
    case 3:
    //HIT
    handDist[argument1] -= 12
    meleeHit(argument1,queuedAnim[argument1])
    handDist[argument1] += 12
        
    handDistDest[argument1] = 12
    handDirDest[argument1] = (0*meleeSwing[argument1])
    handHeightDest[argument1] = 6
    itemRotDest[argument1] = (210*meleeSwing[argument1])
    animDelay[argument1] = .1*s
    break
    
    case 4:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (15*meleeSwing[argument1])
    handHeightDest[argument1] = 5
    itemRotDest[argument1] = (225*meleeSwing[argument1])
    animDelay[argument1] = .1*s
    break
    
    case 5:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (30*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (240*meleeSwing[argument1])
    animDelay[argument1] = .3
    sweetSpot = true
    perfectHitSheen(argument1)
    break
    
    case 6:
    handDistDest[argument1] = 6
    handDirDest[argument1] = (30*meleeSwing[argument1])
    handHeightDest[argument1] = 3
    itemRotDest[argument1] = (270*meleeSwing[argument1])
    animDelay[argument1] = .2*s
    sweetSpot = false
    break
    
    case 7:
    meleeEnd(argument1)
    break
}

#define throwHold
if handItem[argument1] != noone
{
    s = 1/handItem[argument1].throwRate
}
else
{
    s = .3
}

switch(argument0)
{
    case 0:    
    meleeSwing[argument1] = 3-(argument1*2)
    
    handDistDest[argument1] = 4
    handDirDest[argument1] = (90*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (45*meleeSwing[argument1])
    animDelay[argument1] = .1*s
    break

    case 1:
    handDistDest[argument1] = 3
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 3
    itemRotDest[argument1] = (15*meleeSwing[argument1])
    animDelay[argument1] = .3*s
    break

    case 2:
    handDistDest[argument1] = 2
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 2
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    animDelay[argument1] = .3*s
    break
    
    case 3:
    handDistDest[argument1] = 3
    handDirDest[argument1] = (150*meleeSwing[argument1])
    handHeightDest[argument1] = 1
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    animDelay[argument1] = .3
    
    charge[argument1] = 2
    if queuedAnim[argument1] = 1
    {
        queuedAnim[argument1] = 2
    }
    sweetSpot = true
    perfectHitSheen(argument1)
    break
    
    case 4:
    handDistDest[argument1] = 4
    handDirDest[argument1] = (150*meleeSwing[argument1])
    handHeightDest[argument1] = 0
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    animDelay[argument1] = 1*s
    
    sweetSpot = false
    break
    
    case 5:
    throwAttack(argument1)
    break
}



#define throwAnim
if handItem[argument1] != noone
{
    s = 1/handItem[argument1].throwRate
}
else
{
    s = .3
}

switch(argument0)
{
    case 0:
    handDistDest[argument1] = 2
    handDirDest[argument1] = (45*meleeSwing[argument1])
    handHeightDest[argument1] = 2
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    animDelay[argument1] = .03*s
    break

    case 1:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (15*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    animDelay[argument1] = .03*s
    break
    
    case 2:
    handDistDest[argument1] = 16
    handDirDest[argument1] = (0*meleeSwing[argument1])
    handHeightDest[argument1] = 6
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    animDelay[argument1] = .04*s
    break
    
    case 3:
    //HIT
    throwRelease(argument1)
    
    handDistDest[argument1] = 12
    handDirDest[argument1] = (0*meleeSwing[argument1])
    handHeightDest[argument1] = 6
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    animDelay[argument1] = .1*s
    break
    
    case 4:
    throwEnd(argument1)
    break
}

#define weaponChopHold
s = 1/(handItem[argument1].meleeRateMult[queuedAnim[argument1]]*handItem[argument1].meleeRate*(1+((greatWeapon*handItem[argument1].gwRateMult)-greatWeapon)))

switch(argument0)
{
    case 0:    
    meleeSwing[argument1] = 3-(argument1*2)
    
    handDistDest[argument1] = 4
    handDirDest[argument1] = (0*meleeSwing[argument1])
    handHeightDest[argument1] = 2
    itemRotDest[argument1] = (45*meleeSwing[argument1])+30*hFacing
    animDelay[argument1] = .1*s
    break

    case 1:
    handDistDest[argument1] = 3
    handDirDest[argument1] = (0*meleeSwing[argument1])
    handHeightDest[argument1] = 3
    itemRotDest[argument1] = (15*meleeSwing[argument1])+90*hFacing
    animDelay[argument1] = .3*s
    break

    case 2:
    handDistDest[argument1] = 2
    handDirDest[argument1] = (45*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (-15*meleeSwing[argument1])+180*hFacing
    animDelay[argument1] = .3*s
    break
    
    case 3:
    handDistDest[argument1] = 3
    handDirDest[argument1] = (150*meleeSwing[argument1])
    handHeightDest[argument1] = 5
    itemRotDest[argument1] = (-15*meleeSwing[argument1])+210*hFacing
    animDelay[argument1] = .3
    
    charge[argument1] = 2
    if queuedAnim[argument1] = 1
    {
        queuedAnim[argument1] = 2
    }
    sweetSpot = true
    perfectHitSheen(argument1)
    break
    
    case 4:
    handDistDest[argument1] = 4
    handDirDest[argument1] = (150*meleeSwing[argument1])
    handHeightDest[argument1] = 6
    itemRotDest[argument1] = (-15*meleeSwing[argument1])+225*hFacing
    animDelay[argument1] = 1*s
    
    sweetSpot = false
    break
    
    case 5:
    meleeAttack(argument1)
    break
}



#define weaponChop
s = 1/(handItem[argument1].meleeRateMult[queuedAnim[argument1]]*handItem[argument1].meleeRate*(1+((greatWeapon*handItem[argument1].gwRateMult)-greatWeapon)))

switch(argument0)
{
    case 0:
    handDistDest[argument1] = 2
    handDirDest[argument1] = (165*meleeSwing[argument1])
    handHeightDest[argument1] = 8
    itemRotDest[argument1] = (-15*meleeSwing[argument1])+105*hFacing
    animDelay[argument1] = .03*s
    break

    case 1:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (15*meleeSwing[argument1])
    handHeightDest[argument1] = 10
    itemRotDest[argument1] = (0*meleeSwing[argument1])+45*hFacing
    animDelay[argument1] = .03*s
    break
    
    case 2:
    handDistDest[argument1] = 16
    handDirDest[argument1] = (0*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    animDelay[argument1] = .04*s
    break
    
    case 3:
    //HIT
    meleeSwing[argument1] *= hFacing
    meleeHit(argument1,queuedAnim[argument1])
    meleeSwing[argument1] *= hFacing
    
    handDistDest[argument1] = 16
    handDirDest[argument1] = (0*meleeSwing[argument1])
    handHeightDest[argument1] = -4
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    animDelay[argument1] = .1*s
    break
    
    case 4:
    handDistDest[argument1] = 12
    handDirDest[argument1] = (0*meleeSwing[argument1])
    handHeightDest[argument1] = -8
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    animDelay[argument1] = .1*s
    break
    
    case 5:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (0*meleeSwing[argument1])
    handHeightDest[argument1] = -6
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    animDelay[argument1] = .3
    sweetSpot = true
    perfectHitSheen(argument1)
    break
    
    case 6:
    handDistDest[argument1] = 6
    handDirDest[argument1] = (0*meleeSwing[argument1])
    handHeightDest[argument1] = -4
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    animDelay[argument1] = .2*s
    sweetSpot = false
    break
    
    case 7:
    meleeEnd(argument1)
    break
}