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
    
    gwPowMult = 1.25
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
    throwSpeed = 30
    throwSpin = 720
    throwCost = 1
    throwType = dmgType.rend
    throwPen = 0
    
    anim[0] = weaponIdle    //Idle Anim
    anim[1] = weaponHack   //Basic Attack
    anim[2] = weaponChop   //Power Attack
    anim[3] = weaponChopUp   //Alternate Attack (2h)
    anim[4] = weaponCrossHack    
    anim[5] = weaponPommel    //Close attack    
    anim[6] = weaponPull    //Special 2h
    anim[7] = throwAnim     //Special 1h
    anim[8] = weaponEngarde    //Special Idle
    
    animHold[0] = weaponSlashChopHold//Basic Hold Anim (basic+power)
    animHold[1] = weaponChopUpHold//Alt Hold Anim 
    animHold[2] = weaponSlashHold//Roll Hold Anim 
    animHold[3] = weaponPommelHold//Close Hold Anim 
    animHold[4] = weaponStabHold    //Special 2 hold
    animHold[5] = throwHold         //Special 1 hold
    
    for(i = 1; i < 8; i++)
    {
        meleeType[i] = dmgType.rend
        meleeAttackMask[i] = spr_hack
        meleePowMult[i] = 1
        meleeChargePowMult[i] = 1.35
        meleeRateMult[i] = 1
        meleeImpactMult[i] = 1
        meleeLungeMult[i] = 1
        meleeSlowMult[i] = 1
        meleeSizeMult[i] = 1
        meleeSpecialMult[i] = 1
        meleeCostMult[i] = 1
        meleePuntMult[i] = 1
        meleeImpactTypeMult[i] = 0
    }    
    meleeSizeMult[2] = .7
    meleeAttackMask[2] = spr_stab
    meleePowMult[2] = 1.2
    meleePenMod[2] = 35
    
    meleeRateMult[3] = .8
    meleeLungeMult[3] = 1.3
    meleeChargePowMult[3] = 1.5
    meleeRateMult[3] = .8
    meleePowMult[3] = 1.2
    meleePenMod[3] = 35
    meleeImpactTypeMult[3] = 2

    meleeAttackMask[4] = spr_hack
    meleeRateMult[4] = 1.5
    meleeLungeMult[4] = 2
    meleePowMult[4] = 1.2
    meleeImpactTypeMult[4] = 2
    
    meleePowMult[5] = .25
    meleeLungeMult[5] = 2
    meleeType[5] = dmgType.impact
    meleeAttackMask[5] = spr_impact
    meleePenMod[5] = -10
    
    meleePowMult[6] = .1
    meleeLungeMult[6] = 0
    meleeAttackMask[6] = spr_stab
    meleeImpactTypeMult[6] = 1
    meleeImpactMult[6] = -1.5
    meleeSizeMult[6] = -.7
    
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
    tooltip = "This small axe can be used for throwing and opening canned goods."
    
    //Item Stats
    length = 9
    holdPoint = 4
    gwPoint = 1
    weight = 2
                 
    //Weapon Stats
    meleePow = .8
    meleeRate = 2.0
    meleeImpact = 5
    meleeLunge = 6
    meleeSlow = .1
    meleeSize = .8
    meleeCost = 1
    meleePen = 5  
    
    throwPow = 2.4
    throwRate = 2
    throwImpact = 8
    throwLunge = 2
    throwSpeed = 30
    throwCost = 1
    throwPen = 10
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
    tooltip = "Two heads are better than one.  See the second head adds weight and makes it... uh... why did we do this again?"
    
    //Item Stats
    length = 19
    holdPoint = 2
    gwPoint = 3
    weight = 4
             
    //Weapon Stats
    meleePow = 1.2
    meleeRate = 1.3
    meleeImpact = 3
    meleeLunge = 6
    meleeSlow = .2
    meleeSize = 1
    meleeCost = 2
    meleePen = 10
    
    gwPowMult = 1.3  
    
    throwPow = 2.4
    throwRate = 1.5
    throwImpact = 5
    throwLunge = 2
    throwSpeed = 20
    throwCost = 2
    throwPen = 15
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
    tooltip = "The humble long axe is beloved by lumberjanes and lumberjacks everywhere.  No better weapon to fel those accursed trees."
    
    //Item Stats
    length = 35
    holdPoint = -1
    gwPoint = 3
    weight = 6
                   
    //Weapon Stats
    meleePow = 1.4
    meleeRate = .85
    meleeImpact = 4
    meleeLunge = 5
    meleeSlow = .3
    meleeSize = 1.1
    meleeCost = 3
    meleePen = 15 
    
    gwPowMult = 1.35
    gwRateMult = 1.3
       
    throwPow = 2.8
    throwRate = 1.3
    throwImpact = 5
    throwLunge = 2
    throwSpeed = 15
    throwCost = 3
    throwPen = 20
    throwSpin = 360
    break
}