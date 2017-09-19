#define typeSword
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
    
    gwPowMult = 1.35
    gwRateMult = .8
    gwImpactMult = 1.3
    gwLungeMult = 1.2
    gwSlowMult = 1.2
    gwSizeMult = 1.2
    gwCostMult = 1
    
    throwPow = 1
    throwRate = 1
    throwImpact = 1
    throwLunge = 0
    throwSpeed = 25
    throwSpin = 0
    throwCost = 1
    throwType = dmgType.pierce
    throwPen = 25
    
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
    
    meleePenMod[2] = 25
    meleeAttackMask[3] = spr_slam
    meleeChargePowMult[3] = 2
    meleeCostMult[3] = 1.2
    meleeImpactMult[3] = 1.5
    meleePenMod[3] = -10
    meleeAttackMask[4] = spr_stab
    meleePowMult[4] = 1.25
    meleePenMod[4] = 50
    meleeType[5] = dmgType.impact
    meleeAttackMask[5] = spr_impact
    meleePowMult[5] = .5
    meleeImpactMult[5] = 1.5
    meleePenMod[5] = -10
    break
}

#define sword
switch(argument0)
{
    case 0:     //Initialize 
    typeSword(0)
    
    //Core
    name = 'Sword'
    sprite_index = spr_sword
    
    //Item Stats
    length = 17
    holdPoint = 6
    gwPoint = 1
    
    //Weapon Stats
    meleePow = 1
    meleeRate = 1.5
    meleeImpact = 3
    meleeLunge = 3
    meleeSlow = .2
    meleeSize = 1
    meleeCost = 1
    meleePen = 0
    
    throwPow = 1.5
    throwRate = 1.8
    throwImpact = 5
    throwLunge = 5
    throwCost = 1
    break
}

#define circleySword
switch(argument0)
{
    case 0:     //Initialize 
    typeSword(0)    
     
    //Core
    name = 'Circley Sword'
    sprite_index = spr_circleySword
    
    //Item Stats
    length = 19
    holdPoint = 7
    gwPoint = 1
    
    //Weapon Stats
    meleePow = 1.5
    meleeRate = 1.7
    meleeImpact = 4
    meleeLunge = 5
    meleeSlow = .2
    meleeSize = 1.1
    meleeCost = 2
    meleePen = -25   
    
    throwPow = 2
    throwRate = 2
    throwImpact = 6
    throwLunge = 7
    throwCost = 2
    throwSpin = 360
    throwPen = -25
    break
}

#define bigSword
switch(argument0)
{
    case 0:     //Initialize 
    typeSword(0)
        
    //Core
    name = 'Big Sword'
    sprite_index = spr_bigSword
    
    //Item Stats
    length = 25
    holdPoint = 10
    gwPoint = 1
    
    //Weapon Stats
    meleePow = 1.5
    meleeRate = 1.2
    meleeImpact = 4
    meleeLunge = 3
    meleeSlow = .5
    meleeSize = 1.2
    meleeCost = 2
    meleePen = 0  
    
    gwPowMult = 1.4
    
    throwPow = 2
    throwRate = 1.4
    throwImpact = 6
    throwLunge = 5
    throwCost = 2
    break
}

#define biggerSword
switch(argument0)
{
    case 0:     //Initialize 
    typeSword(0)
        
    //Core
    name = 'Bigger Sword'
    sprite_index = spr_biggerSword
    
    //Item Stats
    length = 35
    holdPoint = 15
    gwPoint = 2
           
    //Weapon Stats
    meleePow = 1.7
    meleeRate = 1
    meleeImpact = 5
    meleeLunge = 2
    meleeSlow = .75
    meleeSize = 1.5
    meleeCost = 3
    meleePen = 0  
    
    gwPowMult = 1.5
    
    throwPow = 2.2
    throwRate = 1.2
    throwImpact = 7
    throwLunge = 4
    throwCost = 3
    break
}

#define specialSword
switch(argument0)
{
    case 0:     //Initialize 
    typeSword(0)
    
    //Core
    name = 'Swordstria'
    sprite_index = spr_bigSword
    
    //Item Stats
    length = 25
    holdPoint = 10
    gwPoint = 1
    
    //Weapon Stats
    meleePow = 2
    meleeRate = 1.4
    meleeImpact = 5
    meleeLunge = 3
    meleeSlow = .2
    meleeSize = 1.3
    meleeCost = 1
    meleePen = 25  
    
    gwPowMult = 1.4
    
    throwPow = 4
    throwRate = 1.6
    throwImpact = 7
    throwLunge = 5
    throwCost = 1
    break
}
