#define typePolearm
switch(argument0)
{
    case 0:     //Initialize 
    //Core
    name = -4
    sprite_index = spr_pike
    useScript[1] = melee
    useScript[2] = melee
    
    //Item Stats
    length = 25
    holdPoint = 9
    gwPoint = 2
    
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
    
    gwPowMult = 1.35
    gwRateMult = .8
    gwImpactMult = 1.3
    gwLungeMult = 1.2
    gwSlowMult = 1.2
    gwSizeMult = 1.2
    gwCostMult = 1
    
    throwPow = 1
    throwVariance = 1
    throwRate = 1
    throwImpact = 1
    throwLunge = 0
    throwSpeed = 8
    throwSpin = 0
    throwCost = 1
    throwType = dmgType.pierce
    throwPen = 0
    
    anim[0] = weaponIdle    //Idle Anim
    anim[1] = weaponStab    //Basic Attack
    anim[2] = weaponStab    //Power Attack
    anim[3] = weaponStab   //Alternate Attack (2h)
    anim[4] = weaponSlash    //Roll Attack
    anim[5] = weaponHilt    //Close attack    
    anim[6] = weaponSlash    //Special Slot, called by some items
    anim[7] = throwAnim     //Throw
    
    animHold[0] = weaponStabHold   //Basic Hold Anim (basic+power)
    animHold[1] = weaponChopHold    //Alt Hold Anim 
    animHold[2] = weaponSlashHold    //Roll Hold Anim 
    animHold[3] = weaponHiltHold    //Close Hold Anim 
    animHold[4] = throwHold         //Throw Hold Anim 
    
    for(i = 1; i < 7; i++)
    {
        meleeType[i] = dmgType.pierce
        meleeAttackMask[i] = spr_stab
        meleePowMult[i] = 1
        meleeChargePowMult[i] = 1.5
        meleeRateMult[i] = 1
        meleeImpactMult[i] = 1
        meleeLungeMult[i] = 1
        meleeSlowMult[i] = 1
        meleeSizeMult[i] = 1
        meleeCostMult[i] = 1
    }
    
    meleePenMod[2] = 25
    meleePenMod[3] = 25
    meleeLungeMult[3] = 4
    meleeRateMult[3] = .8
    meleeChargePowMult[3] = 2
    meleeImpactMult[3] = .5
    meleeCostMult[3] = 1.5
    meleePenMod[3] = 50
    meleeType[5] = dmgType.impact
    meleePowMult[5] = .5
    meleeAttackMask[5] = spr_impact
    meleeImpactMult[5] = 1.5
    meleePenMod[5] = -20
    break
}

#define pike
switch(argument0)
{
    case 0:     //Initialize 
    typePolearm(0)
    
    //Core
    name = 'Pike'
    sprite_index = spr_pike
    
    //Item Stats
    length = 63
    holdPoint = 0
    gwPoint = 4
                     
    //Weapon Stats
    meleePow = 1.4
    meleeRate = 1.2
    meleeImpact = 3
    meleeLunge = 2
    meleeSlow = .6
    meleeSize = 1
    meleeCost = 3
    meleePen = 10 

    gwPowMult = 1.4 
    break
}

#define spear
switch(argument0)
{
    case 0:     //Initialize 
    typePolearm(0)
    
    //Core
    name = 'Spear'
    sprite_index = spr_spear
    
    //Item Stats
    length = 37
    holdPoint = 4
    gwPoint = 3
                         
    //Weapon Stats
    meleePow = 1
    meleeRate = 1.8
    meleeImpact = 2
    meleeLunge = 2
    meleeSlow = .4
    meleeSize = .8
    meleeCost = 2
    meleePen = 5  
    break
}