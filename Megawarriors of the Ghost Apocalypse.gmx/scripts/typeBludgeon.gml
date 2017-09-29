#define typeBludgeon
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
    throwSpeed = 20
    throwSpin = 0
    throwCost = 1
    throwType = dmgType.impact
    throwPen = 0
    
    anim[0] = weaponIdle    //Idle Anim
    anim[1] = weaponSlash   //Basic Attack
    anim[2] = weaponSlash   //Power Attack
    anim[3] = weaponChop   //Alternate Attack (2h)
    anim[4] = weaponSlash    //Roll Attack
    anim[5] = weaponPommel    //Close attack    
    anim[6] = weaponSlash    //Special Slot, called by some items
    anim[7] = throwAnim     //Throw
    
    animHold[0] = weaponSlashHold//Basic Hold Anim (basic+power)
    animHold[1] = weaponChopHold//Alt Hold Anim 
    animHold[2] = weaponSlashHold//Roll Hold Anim 
    animHold[3] = weaponPommelHold//Close Hold Anim 
    animHold[4] = throwHold //Throw Hold Anim 
    
    for(i = 1; i < 7; i++)
    {
        meleeType[i] = dmgType.impact
        meleeAttackMask[i] = spr_slash
        meleePowMult[i] = 1
        meleeChargePowMult[i] = 1.4
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
    
    meleePenMod[2] = 25
    meleeAttackMask[3] = spr_slam
    meleeChargePowMult[3] = 2
    meleePowMult[3] = .6
    meleeImpactMult[3] = 1.5
    meleeImpactTypeMult[3] = 1
    meleeCostMult[3] = 1.5
    meleePenMod[3] = -10
    meleeType[5] = dmgType.impact
    meleeAttackMask[5] = spr_impact
    meleePowMult[5] = .5
    meleeImpactMult[5] = 1.5
    meleePenMod[5] = -10
    break
}

#define mace
switch(argument0)
{
    case 0:     //Initialize 
    typeBludgeon(0)
    
    //Core
    name = 'Mace'
    sprite_index = spr_mace
    tooltip = 'Warriors wield maces when they feel the need to justify all those years of doing push ups in mountaintop dojos.'
    
    //Item Stats
    length = 16
    holdPoint = 1
    gwPoint = 3
    weight = 6
    
    //Weapon Stats
    meleePow = 1.5
    meleeRate = 1
    meleeImpact = 4
    meleeLunge = 2
    meleeSlow = .3
    meleeSize = 1
    meleeCost = 2
    meleePen = 15 
    
    gwPowMult = 1.35
    
    throwPow = 1
    throwRate = 1
    throwImpact = 6
    throwCost = 2
    break
}

#define warhammer
switch(argument0)
{
    case 0:     //Initialize 
    typeBludgeon(0)
    
    //Core
    name = 'Warhammer'
    sprite_index = spr_warhammer
    tooltip = "Legends tell of a warhammer that weighs 40 kilograms.  I have no idea who could actually wield such a thing but it probably looks pretty cool."
    
    //Item Stats
    length = 32
    holdPoint = 3
    gwPoint = 3
    weight = 7
    
    //Weapon Stats
    meleePow = 1.8
    meleeRate = .7
    meleeImpact = 5
    meleeLunge = 1
    meleeSlow = .5
    meleeSize = 1.1
    meleeCost = 3
    meleePen = 25 
    
    gwPowMult = 1.4
    gwRateMult = 1.3
        
    throwPow = 1.4
    throwRate = .8
    throwImpact = 7
    throwCost = 3
    throwSpeed = 15
    break
}
#define club
switch(argument0)
{
    case 0:     //Initialize 
    typeBludgeon(0)
    
    //Core
    name = 'Club'
    sprite_index = spr_club
    tooltip = "Somebody just picked up a particularly heavy branch and was like 'I guess this will do'.  That person is probably dead now, actually there most certainly dead because you own this item.  Unless you're the guy.  Don't be that guy."
    
    //Item Stats
    length = 19
    holdPoint = 6
    gwPoint = 2
    weight = 6
    
    //Weapon Stats
    meleePow = 1.5
    meleeRate = 1
    meleeImpact = 4
    meleeLunge = 2
    meleeSlow = .3
    meleeSize = 1
    meleeCost = 2
    meleePen = 15 
    
    gwPowMult = 1.35
    
    throwPow = 1
    throwRate = 1
    throwImpact = 6
    throwCost = 2
    break
}

#define staff
switch(argument0)
{
    case 0:     //Initialize 
    typeBludgeon(0)
    
    //Core
    name = 'Staff'
    sprite_index = spr_staff
    tooltip = "Knights train with this weapon in their special dojos.  It is favoured for its ability to thwack undisciplined would-be hero types on the top of the head when they question your teachings."
        
    //Item Stats
    length = 33
    holdPoint = 0
    gwPoint = 3
    weight = 4
    
    //Weapon Stats
    meleePow = 1.5
    meleeRate = 1
    meleeImpact = 4
    meleeLunge = 2
    meleeSlow = .3
    meleeSize = 1
    meleeCost = 2
    meleePen = 15 
    
    gwPowMult = 1.35
    
    throwPow = 1
    throwRate = 1
    throwImpact = 6
    throwCost = 2
    break
}