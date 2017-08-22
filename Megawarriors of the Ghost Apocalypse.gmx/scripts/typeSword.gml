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
    meleeChargePowMult[i] = 2
    meleeAttackMask[4] = spr_stab
    meleePowMult[4] = 1.25
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
    meleeLunge = 2
    meleeSlow = .2
    meleeSize = 1
    meleeCost = 1
    meleePen = 0
    
    
    
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
    meleePow = 1.2
    meleeRate = 1.8
    meleeImpact = 4
    meleeLunge = 5
    meleeSlow = .2
    meleeSize = 1
    meleeCost = 1
    meleePen = -25   
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
    meleeImpact = 7
    meleeLunge = 5
    meleeSlow = .5
    meleeSize = 1.2
    meleeCost = 2
    meleePen = 0  
    
    gwPowMult = 1.4
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
    meleePow = 1.8
    meleeRate = 1
    meleeImpact = 8
    meleeLunge = 6
    meleeSlow = .75
    meleeSize = 1.5
    meleeCost = 3
    meleePen = 0  
    
    gwPowMult = 1.5
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
    meleeRate = .9
    meleeImpact = 7
    meleeLunge = 5
    meleeSlow = .2
    meleeSize = 1.3
    meleeCost = 1
    meleePen = 25  
    
    gwPowMult = 1.4
    break
}