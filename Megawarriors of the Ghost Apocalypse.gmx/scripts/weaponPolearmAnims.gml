#define weaponPolearmAnims


#define weaponStabUpHold
s = 1/(handItem[argument1].meleeRateMult[queuedAnim[argument1]]*handItem[argument1].meleeRate*(1+((greatWeapon*handItem[argument1].gwRateMult)-greatWeapon)))

switch(argument0)
{
    case 0:    
    handDistDest[argument1] = 2
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 0
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = 20
    animDelay[argument1] = .7*s
    break
    
    case 1:
    handDistDest[argument1] = 3
    handDirDest[argument1] = (150*meleeSwing[argument1])
    handHeightDest[argument1] = -2
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = 25
    animDelay[argument1] = .3
    
    charge[argument1] = 2
    if queuedAnim[argument1] = 1
    {
        queuedAnim[argument1] = 2
    }
    sweetSpot = true
    perfectHitSheen(argument1)
    break
    
    case 2:
    handDistDest[argument1] = 4
    handDirDest[argument1] = (150*meleeSwing[argument1])
    handHeightDest[argument1] = -4
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = 30
    animDelay[argument1] = 1*s
    
    sweetSpot = false
    break
    
    case 3:
    meleeAttack(argument1)
    break
}



#define weaponStabUp
s = 1/(handItem[argument1].meleeRateMult[queuedAnim[argument1]]*handItem[argument1].meleeRate*(1+((greatWeapon*handItem[argument1].gwRateMult)-greatWeapon)))

switch(argument0)
{
    case 0:
    handDistDest[argument1] = 2
    handDirDest[argument1] = (45*meleeSwing[argument1])
    handHeightDest[argument1] = 1
    itemRotDest[argument1] = (-15*meleeSwing[argument1])
    itemZRotDest[argument1] = 25
    animDelay[argument1] = .03*s
    break

    case 1:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (15*meleeSwing[argument1])
    handHeightDest[argument1] = 3
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    itemZRotDest[argument1] = 25
    animDelay[argument1] = .03*s
    break
    
    case 2:
    handDistDest[argument1] = 14
    handDirDest[argument1] = (0*meleeSwing[argument1])
    handHeightDest[argument1] = 5
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    itemZRotDest[argument1] = 25
    animDelay[argument1] = .04*s
    break
    
    case 3:
    //HIT
    meleeHit(argument1,queuedAnim[argument1])
    
    handDistDest[argument1] = 12
    handDirDest[argument1] = (0*meleeSwing[argument1])
    handHeightDest[argument1] = 5
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    itemZRotDest[argument1] = 25
    animDelay[argument1] = .1*s
    break
    
    case 4:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (15*meleeSwing[argument1])
    handHeightDest[argument1] = 5
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    itemZRotDest[argument1] = 25
    animDelay[argument1] = .1*s
    break
    
    case 5:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (30*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (15*meleeSwing[argument1])
    itemZRotDest[argument1] = 25
    animDelay[argument1] = .3
    sweetSpot = true
    perfectHitSheen(argument1)
    break
    
    case 6:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (30*meleeSwing[argument1])
    handHeightDest[argument1] = 3
    itemRotDest[argument1] = (30*meleeSwing[argument1])
    itemZRotDest[argument1] = 20
    animDelay[argument1] = .2*s
    sweetSpot = false
    break
    
    case 7:
    meleeEnd(argument1)
    break
}

#define weaponStabDownHold


#define weaponStabDown
