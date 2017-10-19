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
    throwSpeed = 35
    throwSpin = 0
    throwCost = 1
    throwType = dmgType.pierce
    throwPen = 50
    
    anim[0] = weaponIdle    //Idle Anim
    anim[1] = weaponStab    //Basic Attack
    anim[2] = weaponStab    //Power Attack
    anim[3] = weaponStabDown   //Alternate Attack (2h)
    anim[4] = weaponStabUp    //Roll Attack
    anim[5] = weaponPommel    //Close attack    
    anim[6] = weaponStabUp    //Special 2h
    anim[7] = throwAnim     //Special 1h
    anim[8] = weaponEngarde    //Special Idle
    
    animHold[0] = weaponStabHold   //Basic Hold Anim (basic+power)
    animHold[1] = weaponStabUpHold    //Alt Hold Anim 
    animHold[2] = weaponStabUpHold    //Roll Hold Anim 
    animHold[3] = weaponPommelHold    //Close Hold Anim 
    animHold[4] = weaponMegaLungeHold //Special 2 hold
    animHold[5] = throwHold         //Special 1 hold
    
    for(i = 1; i < 8; i++)
    {
        meleeType[i] = dmgType.pierce
        meleeAttackMask[i] = spr_stab
        meleePowMult[i] = 1
        meleeChargePowMult[i] = 1.3
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
    
    meleePenMod[2] = 25
    
    meleePenMod[3] = 25
    meleeLungeMult[3] = 4
    meleeRateMult[3] = .8
    meleeChargePowMult[3] = 1.8
    meleeImpactMult[3] = .5
    meleeImpactTypeMult[3] = 1
    meleeCostMult[3] = 1.5
    meleePenMod[3] = 50
    
    meleeType[5] = dmgType.impact
    meleePowMult[5] = .5
    meleeAttackMask[5] = spr_impact
    meleeImpactMult[5] = 1.5
    meleePenMod[5] = -20
    
    meleeType[6] = dmgType.pierce
    meleeChargePowMult[6] = 1.4
    meleeImpactTypeMult[6] = 2
    meleeCostMult[6] = 1.5
    meleeLungeMult[6] = 5
    meleePenMod[6] = 50
    meleeAttackMask[6] = spr_stab
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
    tooltip = "For the warrior who wants to stay very far away from their foes but sucks at aiming."
    
    //Item Stats
    length = 63 
    holdPoint = 0
    gwPoint = 4
    weight = 6
    
    force2h = true
                     
    //Weapon Stats
    meleePow = 1.3
    meleeRate = .9
    meleeImpact = 3
    meleeLunge = 2
    meleeSlow = .4
    meleeSize = 1
    meleeCost = 2
    meleePen = 10 

    gwPowMult = 1.35
    gwRateMult = 1.3
    
    throwPow = 2.1
    throwRate = 1
    throwImpact = 3
    throwLunge = 1
    throwSpeed = 10
    throwCost = 2
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
    tooltip = "Stick plus spike brought together with deadly purpose.  Don't make one at home kids."
    
    //Item Stats
    length = 37 
    holdPoint = 4
    gwPoint = 3
    weight = 3
                         
    //Weapon Stats
    meleePow = .9
    meleeRate = 1.8
    meleeImpact = 2
    meleeLunge = 2
    meleeSlow = .3
    meleeSize = .8
    meleeCost = 1
    meleePen = 5  
    
    throwPow = 2
    throwRate = 1.6
    throwImpact = 2
    throwLunge = 1
    throwSpeed = 25
    throwCost = 1
    
    break
}

#define stabbyAxe
switch(argument0)
{
    case 0:     //Initialize 
    typePolearm(0)
    
    //Core
    name = 'Stabby Axe'
    sprite_index = spr_stabbyAxe
    tooltip = "Axes and spears did battle long ago, until they were united by a member of both tribes; the Nerdish 'Halberd' brought peace between worlds."
    
    //Item Stats
    length = 55 
    holdPoint = 0
    gwPoint = 3
    weight = 3
                         
    //Weapon Stats
    meleePow = 1.3
    meleeRate = 1.6
    meleeImpact = 6
    meleeLunge = 3
    meleeSlow = .4
    meleeSize = 1
    meleeCost = 1
    meleePen = 5  
    
    throwPow = 1.5
    throwRate = 1.6
    throwImpact = 2
    throwLunge = 1
    throwSpeed = 15
    throwCost = 1
    
    anim[1] = weaponStab
    meleeAttackMask[1] = spr_stab
    anim[2] = weaponHack
    animHold[0] = weaponStabSlashHold
    meleeAttackMask[2] = spr_hack
    meleeType[1] = dmgType.pierce
    meleeType[2] = dmgType.rend
    
    meleeLungeMult[3] = 3
    
    anim[4] = weaponCrossHack
    animHold[2] = weaponSlashHold
    meleeAttackMask[4] = spr_hack
    meleeRateMult[4] = 1.5
    meleeLungeMult[4] = 2
    meleePowMult[4] = 1.2
    meleeImpactTypeMult[4] = 2
    meleePenMod[4] = 0
    meleeType[4] = dmgType.rend  
    
    anim[6] = weaponPull    //Special 2h
    animHold[4] = weaponStabHold    //Special 2 hold
    meleePowMult[6] = .1
    meleeLungeMult[6] = 0
    meleeAttackMask[6] = spr_stab
    meleeImpactTypeMult[6] = 1
    meleeImpactMult[6] = -1.5
    meleeSizeMult[6] = -.7
    break
}