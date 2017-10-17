switch(argument0)
{
    case 0:     //Initialize 
    //Core
    name = -4
    sprite_index = spr_sword
    useScript[1] = melee
    useScript[2] = melee
    
    //Item Stats
    length = 25
    holdPoint = 9
    gwPoint = 2
    tooltip = ''
    
    //Weapon Stats
    meleePow = 1
    meleeVariance = 1
    meleeRate = 1.2
    meleeImpact = 7
    meleeLunge = 4
    meleeSlow = .5
    meleeSize = 1
    meleeCost = 1
    meleePen = 0
    
    gwPowMult = 1.5
    gwRateMult = .8
    gwImpactMult = 1.3
    gwLungeMult = 1.2
    gwSlowMult = 1.2
    gwSizeMult = 1.2
    gwCostMult = 1.2
    
    throwPow = 1
    throwVariance = 1
    throwRate = 1
    throwImpact = 1
    throwLunge = 0
    throwSpeed = 5
    throwSpin = 180
    throwCost = 1
    throwType = dmgType.pierce
    throwPen = 0
    
    anim[0] = weaponIdle    //Idle Anim
    anim[1] = weaponSlash   //Basic Attack
    anim[2] = weaponSlash   //Power Attack
    anim[3] = weaponChop   //Alternate Attack (2h)
    anim[4] = weaponStab    //Roll Attack
    anim[5] = weaponPommel    //Close attack    
    anim[6] = weaponSlash    //Special Slot, called by some items
    anim[7] = weaponStab     //Special 1h
    anim[8] = weaponIdle    //Special Idle
    
    animHold[0] = weaponSlashHold//Basic Hold Anim (basic+power)
    animHold[1] = weaponChopHold//Alt Hold Anim 
    animHold[2] = weaponStabHold//Roll Hold Anim 
    animHold[3] = weaponPommelHold//Close Hold Anim 
    animHold[4] = throwHold         //Special 2 hold
    animHold[5] = throwHold         //Special 1 hold
    
    for(i = 1; i < 8; i++)
    {
        meleeType[i] = 1
        meleeAttackMask[i] = spr_slash
        meleePowMult[i] = 1
        meleeChargePowMult[i] = 1.5
        meleeRateMult[i] = 1
        meleeImpactMult[i] = 1
        meleeLungeMult[i] = 1
        meleeSlowMult[i] = 1
        meleeSizeMult[i] = 1
        meleeCostMult[i] = 1
        meleePuntMult[i] = 1
        meleeImpactTypeMult[i] = 0
        meleePenMod[i] = 0
    }
    break
}
