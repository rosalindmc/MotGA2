#define typeAxe
switch(argument0)
{
    case 0:     //Initialize 
    //Core
    name = 'Sword'
    sprite_index = spr_sword
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
    throwSpin = 360
    throwCost = 1
    throwType = dmgType.rend
    throwPen = 0
    
    anim[0] = weaponIdle    //Idle Anim
    anim[1] = weaponSlash   //Basic Attack
    anim[2] = weaponSlash   //Power Attack
    anim[3] = weaponChop   //Alternate Attack (2h)
    anim[4] = weaponStab    //Roll Attack
    anim[5] = weaponHilt    //Close attack    
    anim[6] = weaponSlash    //Special Slot, called by some items
    anim[7] = throwAnim     //Throw
    
    animHold[0] = weaponSlashHold//Basic Hold Anim (basic+power)
    animHold[1] = weaponChopHold//Alt Hold Anim 
    animHold[2] = weaponStabHold//Roll Hold Anim 
    animHold[3] = weaponHiltHold//Close Hold Anim 
    animHold[4] = throwHold //Throw Hold Anim 
    
    for(i = 1; i < 7; i++)
    {
        meleeType[i] = dmgType.rend
        meleeAttackMask[i] = spr_slash
        meleePowMult[i] = 1
        meleeChargePowMult[i] = 1.5
        meleeRateMult[i] = 1
        meleeImpactMult[i] = 1
        meleeLungeMult[i] = 1
        meleeSlowMult[i] = 1
        meleeSizeMult[i] = 1
        meleeSpecialMult[i] = 1
        meleeCostMult[i] = 1
    }
    
    meleeAttackMask[3] = spr_stab
    meleeAttackMask[4] = spr_stab
    meleeLungeMult[3] = 0
    meleeRateMult[4] = 2
    meleeLungeMult[4] = 0
    break
}

#define throwyAxe
switch(argument0)
{
    case 0:     //Initialize 
    typeAxe(0)
    
    //Core
    name = 'Throwy Axe'
    sprite_index = spr_throwyAxe
    
    //Item Stats
    length = 9
    holdPoint = 4
    gwPoint = 1
                 
    //Weapon Stats
    meleePow = 2
    meleeRate = 1.6
    meleeImpact = 5
    meleeLunge = 6
    meleeSlow = .1
    meleeSize = .8
    meleeCost = 1
    meleePen = 5  
    
    throwLunge = 5
    throwSpeed = 15
    break
}

#define axe
switch(argument0)
{
    case 0:     //Initialize 
    typeAxe(0)
    
    //Core
    name = 'Axe'
    sprite_index = spr_axe
    
    //Item Stats
    length = 19
    holdPoint = 2
    gwPoint = 3
             
    //Weapon Stats
    meleePow = 3
    meleeRate = .8
    meleeImpact = 8
    meleeLunge = 6
    meleeSlow = .2
    meleeSize = 1.5
    meleeCost = 2
    meleePen = 10  
    break
}

#define longAxe
switch(argument0)
{
    case 0:     //Initialize 
    typeAxe(0)
    
    //Core
    name = 'Long Axe'
    sprite_index = spr_longAxe
    
    //Item Stats
    length = 35
    holdPoint = 4
    gwPoint = 3
    
               
    //Weapon Stats
    meleePow = 3.5
    meleeRate = .6
    meleeImpact = 8
    meleeLunge = 8
    meleeSlow = .5
    meleeSize = 1.5
    meleeCost = 3
    meleePen = 15 
    
    gwPowMult = 1.8
    break
}