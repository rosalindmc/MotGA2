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
    throwLunge = 1
    throwSpeed = 15
    throwSpin = 30
    throwCost = 1
    throwType = dmgType.impact
    throwPen = 0
    
    anim[0] = weaponIdle    //Idle Anim
    anim[1] = weaponHack   //Basic Attack
    anim[2] = weaponSlash   //Power Attack
    anim[3] = weaponChop   //Alternate Attack (2h)
    anim[4] = weaponCrossHack    //Roll Attack
    anim[5] = weaponPommel    //Close attack    
    anim[6] = weaponChopUp    //Special 2h
    anim[7] = weaponCrossHack     //Special 1h
    anim[8] = weaponShoulderRest    //Special Idle
    
    animHold[0] = weaponSlashHold//Basic Hold Anim (basic+power)
    animHold[1] = weaponChopHold//Alt Hold Anim 
    animHold[2] = weaponSlashHold//Roll Hold Anim 
    animHold[3] = weaponPommelHold//Close Hold Anim 
    animHold[4] = weaponChopUpHold         //Special 2 hold
    animHold[5] = weaponSlashHold       //Special 1 hold
    
    for(i = 1; i < 8; i++)
    {
        meleeType[i] = dmgType.impact
        meleeAttackMask[i] = spr_hack
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
        meleePenMod[i] = 0
    }
    
    meleeAttackMask[2] = spr_slash
    meleeImpactMult[2] = 1.2
    meleePenMod[2] = 25
    meleeAttackMask[3] = spr_slam
    meleeChargePowMult[3] = 2
    meleePowMult[3] = .6
    meleeImpactMult[3] = 1.5
    meleeImpactTypeMult[3] = 1
    meleeCostMult[3] = 1.5
    meleePenMod[3] = -10
    
    meleeImpactTypeMult[4] = 2
    meleeImpactMult[4] = 2
    meleeLungeMult[4] = 1.5
    
    meleeAttackMask[5] = spr_impact
    meleePowMult[5] = .5
    meleeLungeMult[5] = 1.5
    meleeImpactMult[5] = 1.5
    meleePenMod[5] = -10
    
    meleeImpactTypeMult[6] = 2
    meleePowMult[6] = .8
    meleeImpactMult[6] = 1.5
    meleeLungeMult[6] = 1.2
   
    meleeImpactTypeMult[7] = 2
    meleePowMult[7] = .8
    meleeImpactMult[7] = 1.5
    meleeLungeMult[7] = 1.2
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
    throwSpeed = 10
    
    animHold[0] = weaponSlashChopHold//Basic Hold Anim (basic+power)
    anim[2] = weaponChop   //Power Attack
    meleeAttackMask[2] = spr_stab
    meleeImpactMult[2] = 2
    meleePuntMult[2] = 0
    meleeSizeMult[2] = .7
    meleePowMult[2] = 1.3
    meleePenMod[2] = 50
    meleePenMod[4] = 25
    meleeImpactTypeMult[2] = 1
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
    weight = 5
    
    //Weapon Stats
    meleePow = 1.3
    meleeRate = .7
    meleeImpact = 8
    meleeLunge = 2
    meleeSlow = .4
    meleeSize = 1
    meleeCost = 2
    meleePen = -5
    
    gwPowMult = 1.35
    gwRateMult = 1.1
    
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
    meleePow = 1.2
    meleeRate = 1.5
    meleeImpact = 4
    meleeLunge = 3
    meleeSlow = .2
    meleeSize = 1.1
    meleeCost = 1
    meleePen = 0 
    
    gwPowMult = 1.35
    
    throwPow = 1
    throwRate = 1
    throwImpact = 6
    throwCost = 2
    throwSpeed = 25
    
    animHold[0] = weaponSlashHold//Basic Hold Anim (basic+power)
    anim[1] = weaponHack   //Basic Attack
    anim[2] = weaponSlash  //Power Attack
    
    meleeAttackMask[1] = spr_hack
    meleeAttackMask[2] = spr_slash
    
    anim[3] = weaponParryRelease   //Alternate Attack (2h)
    animHold[1] = weaponParryHold   //Alt Hold Anim 
    
    animHold[2] = weaponStabUpHold//Roll Hold Anim 
    anim[4] = weaponStabUp    //Roll Attack
    meleeAttackMask[4] = spr_stab
    meleePowMult[4] = 1.25
    meleeRateMult[4] = 1.5
    meleePenMod[4] = 25
    meleeImpactTypeMult[4] = 2
    
    meleeAttackMask[5] = spr_impact
    meleePowMult[5] = .5
    meleeLungeMult[5] = 1.5
    meleeImpactMult[5] = 1.5
    meleePenMod[5] = -10
    break
}