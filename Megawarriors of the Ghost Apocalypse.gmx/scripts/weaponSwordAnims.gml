#define weaponSwordAnims


#define weaponPommelHold
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



#define weaponPommel
if (!grappling && !grappled){
s = 1/(handItem[argument1].meleeRateMult[queuedAnim[argument1]]*handItem[argument1].meleeRate*(1+((greatWeapon*handItem[argument1].gwRateMult)-greatWeapon)))
}
else{ 
s = 1
}

switch(argument0)
{
    case 0:
    handDistDest[argument1] = 2
    handDirDest[argument1] = (45*meleeSwing[argument1])
    handHeightDest[argument1] = 2
    itemRotDest[argument1] = (240*meleeSwing[argument1])
    animDelay[argument1] = .01*s
    break

    case 1:
    handDistDest[argument1] = 6
    handDirDest[argument1] = (15*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (225*meleeSwing[argument1])
    animDelay[argument1] = .02*s
    break
    
    case 2:
    handDistDest[argument1] = 12
    handDirDest[argument1] = (0*meleeSwing[argument1])
    handHeightDest[argument1] = 6
    itemRotDest[argument1] = (195*meleeSwing[argument1])
    animDelay[argument1] = .02*s
    break
    
    case 3:
    //HIT
    handDist[argument1] -= (handItem[argument1].length/2)+handItem[argument1].holdPoint
    meleeHit(argument1,queuedAnim[argument1])
    handDist[argument1] += (handItem[argument1].length/2)+handItem[argument1].holdPoint
        
    handDistDest[argument1] = 8
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

#define weaponStabSlashHold
s = 1/(handItem[argument1].meleeRateMult[queuedAnim[argument1]]*handItem[argument1].meleeRate*(1+((greatWeapon*handItem[argument1].gwRateMult)-greatWeapon)))

switch(argument0)
{
    case 0:    
    handDistDest[argument1] = 4
    handDirDest[argument1] = (90*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (45*meleeSwing[argument1])
    itemZRotDest[argument1] = 5
    animDelay[argument1] = .1*s
    break

    case 1:
    handDistDest[argument1] = 3
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 3
    itemRotDest[argument1] = (15*meleeSwing[argument1])
    itemZRotDest[argument1] = 0
    animDelay[argument1] = .3*s
    break

    case 2:
    handDistDest[argument1] = 2
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 2
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = 0
    animDelay[argument1] = .3*s
    break
    
    case 3:
    handDistDest[argument1] = 2
    handDirDest[argument1] = (150*meleeSwing[argument1])
    handHeightDest[argument1] = 5
    itemRotDest[argument1] = (225*meleeSwing[argument1])
    itemZRotDest[argument1] = 15
    animDelay[argument1] = .3
    
    itemSpriteIndex[argument1] = 3
    
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
    itemZRotDest[argument1] = 15
    animDelay[argument1] = 1*s
    itemSpriteIndex[argument1] = 0
    
    sweetSpot = false
    break
    
    case 5:
    meleeAttack(argument1)
    break
}



#define weaponSlashStabHold
s = 1/(handItem[argument1].meleeRateMult[queuedAnim[argument1]]*handItem[argument1].meleeRate*(1+((greatWeapon*handItem[argument1].gwRateMult)-greatWeapon)))

switch(argument0)
{
    case 0:    
    handDistDest[argument1] = 2
    handDirDest[argument1] = (45*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (120*meleeSwing[argument1])
    itemZRotDest[argument1] = 5
    animDelay[argument1] = .1*s
    break

    case 1:
    handDistDest[argument1] = 2
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (150*meleeSwing[argument1])
    itemZRotDest[argument1] = 10
    itemSpriteIndex[argument1] = 3
    animDelay[argument1] = .3*s
    break

    case 2:
    handDistDest[argument1] = 2
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (180*meleeSwing[argument1])
    itemZRotDest[argument1] = 15
    itemSpriteIndex[argument1] = 0
    animDelay[argument1] = .3*s
    
    if greatWeapon = true
    {
        bodyTwist = meleeSwing[argument1]
    }
    break
    
    case 3:
    handDistDest[argument1] = 3
    handDirDest[argument1] = (150*meleeSwing[argument1])
    handHeightDest[argument1] = 1
    itemRotDest[argument1] = (45*meleeSwing[argument1])
    itemZRotDest[argument1] = 0
    itemSpriteIndex[argument1] = 1
    animDelay[argument1] = .3
    bodyTwist = 0
    
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
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    itemZRotDest[argument1] = -5
    animDelay[argument1] = 1*s
    itemSpriteIndex[argument1] = 0
    sweetSpot = false
    break
    
    case 5:
    meleeAttack(argument1)
    break
}



#define weaponSlashChopHold
s = 1/(handItem[argument1].meleeRateMult[queuedAnim[argument1]]*handItem[argument1].meleeRate*(1+((greatWeapon*handItem[argument1].gwRateMult)-greatWeapon)))

switch(argument0)
{
    case 0:    
    handDistDest[argument1] = 2
    handDirDest[argument1] = (45*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (120*meleeSwing[argument1])
    itemZRotDest[argument1] = 5
    itemSpriteIndex[argument1] = 3
    animDelay[argument1] = .1*s
    break

    case 1:
    handDistDest[argument1] = 2
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (150*meleeSwing[argument1])
    itemZRotDest[argument1] = 10
    animDelay[argument1] = .3*s
    itemSpriteIndex[argument1] = 4
    break

    case 2:
    handDistDest[argument1] = 2
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (225*meleeSwing[argument1])
    itemZRotDest[argument1] = 15
    animDelay[argument1] = .3*s
    
    if greatWeapon = true
    {
        bodyTwist = meleeSwing[argument1]
    }
    break
    
    case 3:
    handDistDest[argument1] = 3
    handDirDest[argument1] = (150*meleeSwing[argument1])
    handHeightDest[argument1] = 5
    itemRotDest[argument1] = (225*meleeSwing[argument1])
    itemZRotDest[argument1] = 60
    animDelay[argument1] = .3
    bodyTwist = 0
    itemSpriteIndex[argument1] = 3
    
    animationStart(humanoidOverswing,0)
    moveTimer = .3
    canMove = false
    
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
    itemRotDest[argument1] = (225*meleeSwing[argument1])
    itemZRotDest[argument1] = 90
    animDelay[argument1] = 1*s
    moveTimer = .1*s
    canMove = false
    
    sweetSpot = false
    break
    
    case 5:
    meleeAttack(argument1)
    break
}



#define weaponMurderHold
s = 1/(handItem[argument1].meleeRateMult[queuedAnim[argument1]]*handItem[argument1].meleeRate*(1+((greatWeapon*handItem[argument1].gwRateMult)-greatWeapon)))

if greatWeapon = false
{
   animationStart(weaponPommelHold,argument1)
}
else
{
switch(argument0)
{
    case 0:    
    queuedAnim[argument1] = 6
    handDistDest[argument1] = 2
    handDirDest[argument1] = (45*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (120*meleeSwing[argument1])
    itemZRotDest[argument1] = 5
    animDelay[argument1] = .1*s
    itemHoldAdjust[argument1] = -handItem[argument1].holdPoint
    itemFlip[argument1] = -1
    break

    case 1:
    handDistDest[argument1] = 2
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (150*meleeSwing[argument1])
    itemZRotDest[argument1] = 10
    animDelay[argument1] = .3*s
    break

    case 2:
    handDistDest[argument1] = 2
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (225*meleeSwing[argument1])
    itemZRotDest[argument1] = 15
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
    itemZRotDest[argument1] = 15
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
    itemZRotDest[argument1] = 15
    animDelay[argument1] = 1*s
    
    sweetSpot = false
    break
    
    case 5:
    meleeAttack(argument1)
    break
}
}

#define weaponMurder
s = 1/(handItem[argument1].meleeRateMult[queuedAnim[argument1]]*handItem[argument1].meleeRate*(1+((greatWeapon*handItem[argument1].gwRateMult)-greatWeapon)))

meleeSwing[argument1] = hFacing
itemFlip[argument1] = -1

switch(argument0)
{
    case 0:
    handDistDest[argument1] = 4
    handDirDest[argument1] = (90*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (120*meleeSwing[argument1])
    itemZRotDest[argument1] = 10
    animDelay[argument1] = .01*s
    
    itemSpriteIndex[argument1] = 3
    
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
    itemZRotDest[argument1] = 5
    animDelay[argument1] = .02*s
    
    itemSpriteIndex[argument1] = 4
    break
    
    case 2:
    handDistDest[argument1] = 12
    handDirDest[argument1] = (-15*meleeSwing[argument1])
    handHeightDest[argument1] = 2
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    itemZRotDest[argument1] = 0
    animDelay[argument1] = .02*s
    break
    
    case 3:
    //HIT
    meleeHit(argument1,queuedAnim[argument1])
    
    handDistDest[argument1] = 10
    handDirDest[argument1] = (-45*meleeSwing[argument1])
    handHeightDest[argument1] = 1
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = -5
    animDelay[argument1] = .1*s
    
    itemSpriteIndex[argument1] = 0
    break
    
    case 4:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (-60*meleeSwing[argument1])
    handHeightDest[argument1] = 1
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = -5
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
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = -5
    animDelay[argument1] = .3
    sweetSpot = true
    perfectHitSheen(argument1)
    break
    
    case 6:
    handDistDest[argument1] = 6
    handDirDest[argument1] = (-60*meleeSwing[argument1])
    handHeightDest[argument1] = 0
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = -5
    animDelay[argument1] = .2*s
    sweetSpot = false
    break
    
    case 7:
    meleeEnd(argument1)
    break
}

#define weaponHack
s = 1/(handItem[argument1].meleeRateMult[queuedAnim[argument1]]*handItem[argument1].meleeRate*(1+((greatWeapon*handItem[argument1].gwRateMult)-greatWeapon)))

switch(argument0)
{
    case 0:
    handDistDest[argument1] = 4
    handDirDest[argument1] = (90*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (120*meleeSwing[argument1])
    itemZRotDest[argument1] = 10
    animDelay[argument1] = .01*s
    
    itemSpriteIndex[argument1] = 1
    
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
    itemZRotDest[argument1] = 5
    animDelay[argument1] = .02*s
    
    itemSpriteIndex[argument1] = 2
    break
    
    case 2:
    handDistDest[argument1] = 12
    handDirDest[argument1] = (-15*meleeSwing[argument1])
    handHeightDest[argument1] = 2
    itemRotDest[argument1] = (10*meleeSwing[argument1])
    itemZRotDest[argument1] = 0
    animDelay[argument1] = .02*s
    break
    
    case 3:
    //HIT
    meleeHit(argument1,queuedAnim[argument1])
    
    handDistDest[argument1] = 10
    handDirDest[argument1] = (-45*meleeSwing[argument1])
    handHeightDest[argument1] = 1
    itemRotDest[argument1] = (-20*meleeSwing[argument1])
    itemZRotDest[argument1] = 0
    animDelay[argument1] = .1*s
    
    itemSpriteIndex[argument1] = 5
    break
    
    case 4:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (-60*meleeSwing[argument1])
    handHeightDest[argument1] = 1
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = 0
    animDelay[argument1] = .1*s
    
    itemSpriteIndex[argument1] = 0
    
    if greatWeapon = true
    {
        bodyTwist = -meleeSwing[argument1]
    }
    break
    
    case 5:
    handDistDest[argument1] = 6
    handDirDest[argument1] = (-60*meleeSwing[argument1])
    handHeightDest[argument1] = 0
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = 0
    animDelay[argument1] = .3
    sweetSpot = true
    perfectHitSheen(argument1)
    break
    
    case 6:
    handDistDest[argument1] = 6
    handDirDest[argument1] = (-60*meleeSwing[argument1])
    handHeightDest[argument1] = 0
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = 0
    animDelay[argument1] = .2*s
    sweetSpot = false
    break
    
    case 7:
    meleeEnd(argument1)
    break
}

#define weaponParryHold
s = 1/(handItem[argument1].meleeRateMult[queuedAnim[argument1]]*handItem[argument1].meleeRate*(1+((greatWeapon*handItem[argument1].gwRateMult)-greatWeapon)))

switch(argument0)
{
    case 0:    
    handDistDest[argument1] = 4
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 6
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = -10
    animDelay[argument1] = .3
    strike[argument1] = 1
    charge[argument1] = 2
    moveTimer = .3
    canMove = false
    animationStart(humanoidBrace,0)
    break

    case 1:
    handDistDest[argument1] = 4
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 6
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = -15
    animDelay[argument1] = .1  *s
    perfectHitSheen(argument1)
    sweetSpot = true
    moveTimer = .1*s
    break

    case 2:
    handDistDest[argument1] = 4
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 6
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = -20
    animDelay[argument1] = .05*s
    moveTimer = .05*s
    canMove = false
    sweetSpot = false
    break
    
    case 3:
    handDistDest[argument1] = 4
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 6
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = -25
    animDelay[argument1] = .05*s
    moveTimer = .05*s
    canMove = false
    break
    
    case 4:
    handDistDest[argument1] = 4
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 6
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = -25
    animDelay[argument1] = .05*s
    moveTimer = .05*s
    canMove = false
    break
    
    case 5:
    meleeAttack(argument1)
    break
}

#define weaponParryRelease
strike[argument0] = 0
hspd = 0
vspd = 0

meleeEnd(argument1)

#define weaponCrossHack
s = 1/(handItem[argument1].meleeRateMult[queuedAnim[argument1]]*handItem[argument1].meleeRate*(1+((greatWeapon*handItem[argument1].gwRateMult)-greatWeapon)))

switch(argument0)
{
    case 0:
    handDistDest[argument1] = 4
    handDirDest[argument1] = (90*meleeSwing[argument1])
    handHeightDest[argument1] = -4
    itemRotDest[argument1] = (180*meleeSwing[argument1])
    itemZRotDest[argument1] = -45
    animDelay[argument1] = .01*s
    
    itemSpriteIndex[argument1] = 1
    
    if greatWeapon = true
    {
        bodyTwist = 0
    }
    break

    case 1:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (45*meleeSwing[argument1])
    handHeightDest[argument1] = 2
    itemRotDest[argument1] = (90*meleeSwing[argument1])
    itemZRotDest[argument1] = -15
    animDelay[argument1] = .02*s
    
    itemSpriteIndex[argument1] = 2
    break
    
    case 2:
    handDistDest[argument1] = 12
    handDirDest[argument1] = (-15*meleeSwing[argument1])
    handHeightDest[argument1] = 8
    itemRotDest[argument1] = (10*meleeSwing[argument1])
    itemZRotDest[argument1] = 45
    animDelay[argument1] = .02*s
    break
    
    case 3:
    //HIT
    meleeHit(argument1,queuedAnim[argument1])
    
    handDistDest[argument1] = 10
    handDirDest[argument1] = (-45*meleeSwing[argument1])
    handHeightDest[argument1] = 7
    itemRotDest[argument1] = (-20*meleeSwing[argument1])
    itemZRotDest[argument1] = 30
    animDelay[argument1] = .1*s
    
    itemSpriteIndex[argument1] = 5
    break
    
    case 4:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (-60*meleeSwing[argument1])
    handHeightDest[argument1] = 6
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = 30
    animDelay[argument1] = .1*s
    
    itemSpriteIndex[argument1] = 0
    
    if greatWeapon = true
    {
        bodyTwist = -meleeSwing[argument1]
    }
    break
    
    case 5:
    handDistDest[argument1] = 6
    handDirDest[argument1] = (-60*meleeSwing[argument1])
    handHeightDest[argument1] = 6
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = 30
    animDelay[argument1] = .3
    sweetSpot = true
    perfectHitSheen(argument1)
    break
    
    case 6:
    handDistDest[argument1] = 6
    handDirDest[argument1] = (-60*meleeSwing[argument1])
    handHeightDest[argument1] = 6
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = 30
    animDelay[argument1] = .2*s
    sweetSpot = false
    break
    
    case 7:
    meleeEnd(argument1)
    break
}

#define weaponLeapSlash
s = 1/(handItem[argument1].meleeRateMult[queuedAnim[argument1]]*handItem[argument1].meleeRate*(1+((greatWeapon*handItem[argument1].gwRateMult)-greatWeapon)))

switch(argument0)
{
    case 0:
    zspd += 4
    handDistDest[argument1] = 4
    handDirDest[argument1] = (90*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (120*meleeSwing[argument1])
    itemZRotDest[argument1] = 10
    animDelay[argument1] = .3
    moveTimer = .3
    canMove = false
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
    itemZRotDest[argument1] = 5
    animDelay[argument1] = .02*s
    itemSpriteIndex[argument1] = 1
    break
    
    case 2:
    handDistDest[argument1] = 12
    handDirDest[argument1] = (-15*meleeSwing[argument1])
    handHeightDest[argument1] = 2
    itemRotDest[argument1] = (10*meleeSwing[argument1])
    itemZRotDest[argument1] = 0
    animDelay[argument1] = .02*s
    itemSpriteIndex[argument1] = 2
    break
    
    case 3:
    //HIT
    meleeHit(argument1,queuedAnim[argument1])
    
    handDistDest[argument1] = 10
    handDirDest[argument1] = (-45*meleeSwing[argument1])
    handHeightDest[argument1] = 1
    itemRotDest[argument1] = (-20*meleeSwing[argument1])
    itemZRotDest[argument1] = 0
    animDelay[argument1] = .1*s
    
    itemSpriteIndex[argument1] = 5
    break
    
    case 4:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (-60*meleeSwing[argument1])
    handHeightDest[argument1] = 1
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = 0
    animDelay[argument1] = .1*s
    
    if greatWeapon = true
    {
        bodyTwist = -meleeSwing[argument1]
    }
    
    itemSpriteIndex[argument1] = 0
    break
    
    case 5:
    handDistDest[argument1] = 6
    handDirDest[argument1] = (-60*meleeSwing[argument1])
    handHeightDest[argument1] = 0
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = 0
    animDelay[argument1] = .3
    sweetSpot = true
    perfectHitSheen(argument1)
    break
    
    case 6:
    handDistDest[argument1] = 6
    handDirDest[argument1] = (-60*meleeSwing[argument1])
    handHeightDest[argument1] = 0
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = 0
    animDelay[argument1] = .2*s
    sweetSpot = false
    break
    
    case 7:
    meleeEnd(argument1)
    break
}

#define weaponChopUpHold
s = 1/(handItem[argument1].meleeRateMult[queuedAnim[argument1]]*handItem[argument1].meleeRate*(1+((greatWeapon*handItem[argument1].gwRateMult)-greatWeapon)))

meleeSwing[argument1] = -hFacing

switch(argument0)
{
    case 0:    
    handDistDest[argument1] = 4
    handDirDest[argument1] = (0*meleeSwing[argument1])
    handHeightDest[argument1] = 2
    itemRotDest[argument1] = (45*meleeSwing[argument1])
    itemZRotDest[argument1] = -45
    animDelay[argument1] = .1*s
    
    animationStart(humanoidBrace,0)    
    moveTimer = .1*s
    canMove = false
    break

    case 1:
    handDistDest[argument1] = 3
    handDirDest[argument1] = (0*meleeSwing[argument1])
    handHeightDest[argument1] = 0
    itemRotDest[argument1] = (15*meleeSwing[argument1])
    itemZRotDest[argument1] = -90
    animDelay[argument1] = .3*s
    moveTimer = .3*s
    canMove = false
    break

    case 2:
    handDistDest[argument1] = 2
    handDirDest[argument1] = (45*meleeSwing[argument1])
    handHeightDest[argument1] = -2
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = -135
    animDelay[argument1] = .3*s
    moveTimer = .3*s
    canMove = false
    break
    
    case 3:
    handDistDest[argument1] = 3
    handDirDest[argument1] = (150*meleeSwing[argument1])
    handHeightDest[argument1] = 0
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = -150
    animDelay[argument1] = .3
    moveTimer = .3
    canMove = false
    
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
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = -165
    animDelay[argument1] = 1*s
    moveTimer = .1*s
    canMove = false
    
    sweetSpot = false
    break
    
    case 5:
    meleeAttack(argument1)
    break
}



#define weaponChopUp
s = 1/(handItem[argument1].meleeRateMult[queuedAnim[argument1]]*handItem[argument1].meleeRate*(1+((greatWeapon*handItem[argument1].gwRateMult)-greatWeapon)))

meleeSwing[argument1] = -hFacing

switch(argument0)
{
    case 0:
    handDistDest[argument1] = 2
    handDirDest[argument1] = (165*meleeSwing[argument1])
    handHeightDest[argument1] = -4
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = -105
    animDelay[argument1] = .01*s
    
    itemSpriteIndex[argument1] = 1
    break

    case 1:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (15*meleeSwing[argument1])
    handHeightDest[argument1] = -2
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    itemZRotDest[argument1] = -45
    animDelay[argument1] = .02*s
    
    itemSpriteIndex[argument1] = 2
    break
    
    case 2:
    handDistDest[argument1] = 16
    handDirDest[argument1] = (0*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    itemZRotDest[argument1] = 0
    animDelay[argument1] = .02*s
    break
    
    case 3:
    //HIT
    hspd = 0
    vspd = 0
    meleeHit(argument1,queuedAnim[argument1])
    
    handDistDest[argument1] = 16
    handDirDest[argument1] = (0*meleeSwing[argument1])
    handHeightDest[argument1] = 8
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    itemZRotDest[argument1] = 45
    animDelay[argument1] = .1*s
    
    itemSpriteIndex[argument1] = 5
    break
    
    case 4:
    handDistDest[argument1] = 12
    handDirDest[argument1] = (0*meleeSwing[argument1])
    handHeightDest[argument1] = 8
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    itemZRotDest[argument1] = 45
    animDelay[argument1] = .1*s
    
    itemSpriteIndex[argument1] = 0
    break
    
    case 5:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (0*meleeSwing[argument1])
    handHeightDest[argument1] = 6
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    itemZRotDest[argument1] = 15
    animDelay[argument1] = .3
    sweetSpot = true
    perfectHitSheen(argument1)
    break
    
    case 6:
    handDistDest[argument1] = 6
    handDirDest[argument1] = (0*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    itemZRotDest[argument1] = -15
    animDelay[argument1] = .2*s
    sweetSpot = false
    break
    
    case 7:
    meleeEnd(argument1)
    break
}
