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
    throwSpeed = 25
    throwSpin = 0
    throwCost = 1
    throwType = dmgType.pierce
    throwPen = 25
    
    anim[0] = weaponIdle    //Idle Anim
    anim[1] = weaponSlash   //Basic Attack
    anim[2] = weaponSlash   //Power Attack
    anim[3] = weaponParryRelease   //Alternate Attack (2h)
    anim[4] = weaponStabUp    //Roll Attack
    anim[5] = weaponPommel    //Close attack    
    anim[6] = weaponMurder    //Special 2h  
    anim[7] = weaponStab      //Special 1h
    anim[8] = weaponHalfSword   //Special Idle   
    
    animHold[0] = weaponSlashHold//Basic Hold Anim (basic+power)
    animHold[1] = weaponParryHold//Alt Hold Anim 
    animHold[2] = weaponStabUpHold//Roll Hold Anim 
    animHold[3] = weaponPommelHold//Close Hold Anim 
    animHold[4] = weaponMurderHold  //Special 2 hold
    animHold[5] = weaponStabHold      //Special 1 hold
    
    for(i = 1; i < 8; i++)
    {
        meleeType[i] = dmgType.rend
        meleeAttackMask[i] = spr_slash
        meleePowMult[i] = 1
        meleeChargePowMult[i] = 1.3
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
    
    meleeAttackMask[4] = spr_stab
    meleeType[4] = dmgType.pierce
    meleePowMult[4] = 1.25
    meleePenMod[4] = 50
    meleeImpactTypeMult[4] = 2
    meleeRateMult[4] = 1.5
    meleeLungeMult[4] = 1.5

    meleeType[5] = dmgType.impact
    meleeAttackMask[5] = spr_impact
    meleePowMult[5] = .5
    meleeImpactMult[5] = 1.5
    meleePenMod[5] = -10
    
    meleeType[6] = dmgType.pierce
    meleePowMult[6] = .9
    meleeChargePowMult[6] = 1.6
    meleeSizeMult[6] = .7
    meleeImpactMult[6] = .8
    meleeImpactTypeMult[6] = 1
    meleePenMod[6] = 50
    meleeAttackMask[6] = spr_hack
        
    meleeAttackMask[7] = spr_stab
    meleeType[7] = dmgType.pierce
    meleePenMod[7] = 50
    break
}

#define knife
switch(argument0)
{
    case 0:     //Initialize 
    typeSword(0)
    
    //Core
    name = 'Knife'
    sprite_index = spr_knife
    tooltip = "Some say knives will grow into swords one day but they are wrong.  Knives are the ponies of swords.  Ponies aren't baby horses by the way.  Sorry if you had to find out this way."
    
    //Item Stats
    length = 8
    holdPoint = 3
    gwPoint = 1
    weight = 3
    
    //Weapon Stats
    meleePow = .5
    meleeRate = 2.5
    meleeImpact = .5
    meleeLunge = 2
    meleeSlow = 0
    meleeSize = .7
    meleeCost = 1
    meleePen = 10
    
    throwPow = 2
    throwRate = 2
    throwImpact = 3
    throwLunge = 1
    throwCost = 1
    throwSpeed = 30
    throwSpin = 720
    
    anim[1] = weaponHack
    anim[3] = weaponStab
    anim[6] = weaponLeapHack //Special 2h  
    anim[7] = throwAnim      //Special 1h
    anim[8] = weaponReverseKnife   //Special Idle  
    
    animHold[0] = weaponSlashHold    //Basic Hold Anim (basic+power)
    animHold[1] = weaponSlashHold
    animHold[4] = weaponChopHold  //Special 2 hold
    animHold[5] = throwHold         //Special 1 hold
        
    meleeAttackMask[1] = spr_hack
    

    meleeLungeMult[3] = 1.5
    meleeAttackMask[3] = spr_stab
    meleePenMod[5] = 50
    
    anim[5] = weaponHack   //Close Attack
    animHold[3] = weaponSlashHold//Close Hold Anim
    meleeType[5] = dmgType.rend
    meleeAttackMask[5] = spr_hack
    meleePowMult[5] = 1.5
    meleeImpactMult[5] = 1.25
    meleePenMod[5] = 0
    
    meleeLungeMult[6] = 2
    meleeChargePowMult[6] = 4
    meleeRateMult[6] = .5
    meleeType[6] = dmgType.pierce
    meleeAttackMask[6] = spr_stab
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
    tooltip = "A typical stabby slashy hacky sword for typical megawarriors."
    
    //Item Stats
    length = 17
    holdPoint = 6
    gwPoint = 1
    weight = 3
    
    //Weapon Stats
    meleePow = 1
    meleeRate = 1.5
    meleeImpact = 3
    meleeLunge = 3
    meleeSlow = .1
    meleeSize = 1
    meleeCost = 1
    meleePen = 0
    
    throwPow = 1.5
    throwRate = 1.8
    throwImpact = 5
    throwLunge = 1
    throwCost = 1
    throwSpeed = 20
    
    anim[1] = weaponHack
    anim[6] = weaponStabDown //Special 2h   
    anim[8] = weaponEngarde   //Special Idle

    animHold[4] = weaponStabUpHold
    
 
    meleeAttackMask[1] = spr_hack
    
    meleePowMult[3] = 1.2
    meleeChargePowMult[3] = 1.5
    meleeSizeMult[3] = .7
    meleeCostMult[3] = 1
    meleeImpactMult[3] = 1.2
    meleeImpactTypeMult[3] = 1
    meleePenMod[3] = 15
    meleeAttackMask[3] = spr_stab
    
    meleeAttackMask[6] = spr_stab
    meleePenMod[6] = 40
    meleeType[6] = dmgType.pierce
    meleeLungeMult[6] = 2
    break
}

#define choppySword
switch(argument0)
{
    case 0:     //Initialize 
    typeSword(0)    
     
    //Core
    name = 'Choppy Sword'
    sprite_index = spr_choppySword
    tooltip = "This blade whacks bushes.  And I suppose other types of foliage."
        
    //Item Stats
    length = 19
    holdPoint = 7
    gwPoint = 1
    weight = 4
    
    //Weapon Stats
    meleePow = .7
    meleeRate = 2.0
    meleeImpact = 5
    meleeLunge = 6
    meleeSlow = .1
    meleeSize = .9
    meleeCost = 1
    meleePen = -20   
    
    throwPow = 1
    throwRate = 2
    throwImpact = 6
    throwLunge = 2
    throwCost = 1
    throwSpin = 360
    throwSpeed = 20
    throwPen = -10
    
    anim[2] = weaponChop
    animHold[0] = weaponSlashChopHold
    meleeAttackMask[2] = spr_stab
    meleeSizeMult[2] = .7
    meleePowMult[2] = 1.2
    
    anim[3] = weaponSlash
    animHold[1] = weaponSlashHold
    meleeChargePowMult[3] = 1.5
    meleeRateMult[3] = .8
    meleeLungeMult[3] = 1.3
    
    //No stabbing all hacking
    anim[4] = weaponCrossHack
    animHold[2] = weaponSlashHold
    meleeAttackMask[4] = spr_hack
    meleeRateMult[4] = 1.5
    meleeLungeMult[4] = 1.5
    meleePowMult[4] = 1.2
    meleeImpactTypeMult[4] = 2
    meleePenMod[4] = 0
    meleeType[4] = dmgType.rend
    
    meleePowMult[5] = .25
    meleeLungeMult[5] = 2
    
    anim[7] = weaponCrossHack
    animHold[5] = weaponSlashHold
    meleeAttackMask[7] = spr_hack
    meleePowMult[7] = 1.2
    meleeImpactTypeMult[7] = 2
    meleePenMod[7] = 0
    meleeType[7] = dmgType.rend
    
    anim[6] = weaponLeapHack
    animHold[4] = weaponStabUpHold
    meleeAttackMask[6] = spr_stab
    meleePowMult[6] = 1.4
    meleeLungeMult[6] = 2
    meleeImpactTypeMult[6] = 2
    meleePenMod[6] = 0
    meleeType[6] = dmgType.rend
    
    anim[8] = weaponNinjaHold
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
    tooltip = "This is like a sword but you can't stab with it... or slash the other way with it....or put it in a scabbard.  It looks like a moon though, that's worth something."
    
    //Item Stats
    length = 19
    holdPoint = 7
    gwPoint = 1
    weight = 4
    
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
    throwLunge = 2
    throwCost = 2
    throwSpin = 360
    throwSpeed = 15
    throwPen = -25
    
    anim[2] = weaponChop
    animHold[0] = weaponSlashChopHold
    meleeAttackMask[2] = spr_stab
    meleeSizeMult[2] = .7
    meleePowMult[2] = 1.2
    
    anim[3] = weaponSlash
    animHold[1] = weaponSlashHold
    meleeChargePowMult[3] = 1.5
    meleeRateMult[3] = .8
    meleeLungeMult[3] = 1.3
    
    //No stabbing all hacking
    anim[4] = weaponCrossHack
    animHold[2] = weaponSlashHold
    meleeAttackMask[4] = spr_hack
    meleeRateMult[4] = 1.5
    meleeLungeMult[4] = 1.5
    meleePowMult[4] = 1.2
    meleeImpactTypeMult[4] = 2
    meleePenMod[4] = 0
    meleeType[4] = dmgType.rend
    
    anim[7] = weaponCrossHack
    animHold[5] = weaponSlashHold
    meleeAttackMask[7] = spr_hack
    meleePowMult[7] = 1.2
    meleeImpactTypeMult[7] = 2
    meleePenMod[7] = 0
    meleeType[7] = dmgType.rend
    
    anim[6] = weaponLeapHack
    animHold[4] = weaponStabUpHold
    meleeAttackMask[6] = spr_stab
    meleePowMult[6] = 1.4
    meleeLungeMult[6] = 2
    meleeImpactTypeMult[6] = 2
    meleePenMod[6] = 0
    meleeType[6] = dmgType.rend
    
    anim[8] = weaponNinjaHold
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
    tooltip = "The big sword beats up smaller swords and steals their lunch money and kisses their girlfriends.  Don't be like sword, be like big sword."
    
    //Item Stats
    length = 25
    holdPoint = 10
    gwPoint = 1
    weight = 6
    
    //Weapon Stats
    meleePow = 1.5
    meleeRate = 1.1
    meleeImpact = 4
    meleeLunge = 3
    meleeSlow = .3
    meleeSize = 1.2
    meleeCost = 2
    meleePen = 0  
    
    gwPowMult = 1.35
    gwRateMult = 1
    
    throwPow = 2
    throwRate = 1.4
    throwImpact = 6
    throwLunge = 2
    throwCost = 2
    throwSpeed = 15
    
    anim[1] = weaponHack
    meleeAttackMask[1] = spr_hack
    break
}

#define stabbySword
switch(argument0)
{
    case 0:     //Initialize 
    typeSword(0)
        
    //Core
    name = 'Stabby Sword'
    sprite_index = spr_stabbySword
    tooltip = "A sword for people who think their better than everyone else.  They insist on calling it by it's ancient nerdish name Rapier."
    
    //Item Stats
    length = 23
    holdPoint = 6
    gwPoint = 1
    weight = 4
    
    //Weapon Stats
    meleePow = 1
    meleeRate = 1.3
    meleeImpact = 2
    meleeLunge = 3
    meleeSlow = .1
    meleeSize = 1
    meleeCost = 1
    meleePen = 5  
    
    throwPow = 3
    throwRate = 1.4
    throwImpact = 3
    throwLunge = 1
    throwCost = 1
    throwSpeed = 20    
    
    anim[1] = weaponHack    //Basic Attack
    anim[6] = weaponStabUp //Special 2h   
    anim[8] = weaponEngarde   //Special Idle
    
    animHold[0] = weaponSlashHold//Basic Hold Anim (basic+power)
    animHold[4] = weaponMegaLungeHold  //Special 2 hold
    meleeAttackMask[1] = spr_hack
    meleePowMult[1] = .6
    meleePowMult[2] = .8
    
    meleeRateMult[4] = 1.5
    meleeLungeMult[4] = 1.5
    meleePowMult[4] = 1.2
    
    meleeType[6] = dmgType.pierce
    meleePowMult[6] = 1
    meleeChargePowMult[6] = 1.4
    meleeSizeMult[6] = 1
    meleeImpactTypeMult[6] = 2
    meleeCostMult[6] = 1.2
    meleeLungeMult = 3
    meleePenMod[6] = 50
    meleeAttackMask[6] = spr_stab
    break
}

#define edgeySword
switch(argument0)
{
    case 0:     //Initialize 
    typeSword(0)
        
    //Core
    name = 'Edgey Sword'
    sprite_index = spr_edgeySword
    tooltip = "No weapon is cause for more heated debate than what the ancient nerdish called a 'Katana'.  Warriors' all have very strong opinions on the merits of a sword with only one edge."      
    
    //Item Stats
    length = 28
    holdPoint = 12
    gwPoint = 2
    weight = 5
    
    //Weapon Stats
    meleePow = 1.4
    meleeRate = 1.2
    meleeImpact = 3
    meleeLunge = 5
    meleeSlow = .2
    meleeSize = 1.1
    meleeCost = 2
    meleePen = -5  
    
    gwPowMult = 1.35
    gwRateMult = 1.2
    
    throwPow = 1.7
    throwRate = 1.4
    throwImpact = 5
    throwLunge = 1
    throwCost = 2
    throwSpeed = 15
    
    anim[1] = weaponHack
    meleeAttackMask[1] = spr_hack
    anim[2] = weaponChop
    animHold[0] = weaponSlashChopHold
    meleeAttackMask[2] = spr_stab
    meleeSizeMult[2] = .7
    meleePowMult[2] = 1.2
    
    anim[3] = weaponSlash
    animHold[1] = weaponSlashHold
    meleeChargePowMult[3] = 1.5
    meleeRateMult[3] = .8
    meleeLungeMult[3] = 1.3
    
    anim[4] = weaponCrossHack
    animHold[2] = weaponSlashHold
    meleeAttackMask[4] = spr_hack
    meleeRateMult[4] = 1.5
    meleeLungeMult[4] = 2
    meleePowMult[4] = 1.2
    meleeImpactTypeMult[4] = 2
    meleePenMod[4] = 0
    meleeType[4] = dmgType.rend
    
    meleePowMult[5] = .25
    meleeLungeMult[5] = 2
    
    anim[7] = weaponCrossHack
    animHold[5] = weaponSlashHold
    meleeAttackMask[7] = spr_hack
    meleePowMult[7] = 1.2
    meleeImpactTypeMult[7] = 2
    meleePenMod[7] = 0
    meleeType[7] = dmgType.rend
    
    anim[6] = weaponLeapHack
    animHold[4] = weaponStabUpHold
    meleeAttackMask[6] = spr_stab
    meleePowMult[6] = 1.4
    meleeLungeMult[6] = 2
    meleeImpactTypeMult[6] = 2
    meleePenMod[6] = 0
    meleeType[6] = dmgType.rend
    
    anim[8] = weaponNinjaHold
    break
}

#define bigStabbySword
switch(argument0)
{
    case 0:     //Initialize 
    typeSword(0)
        
    //Core
    name = 'Big Stabby Sword'
    sprite_index = spr_bigStabbySword
    tooltip = "This giant spike is excellent for skewering armoured foes and pretending it's a more elegent weapon than a giant spike."
        
    //Item Stats
    length = 25
    holdPoint = 10
    gwPoint = 1
    weight = 6
    
    //Weapon Stats
    meleePow = 1.5
    meleeRate = 1.2
    meleeImpact = 3
    meleeLunge = 3
    meleeSlow = .3
    meleeSize = 1.1
    meleeCost = 2
    meleePen = 10 
    
    gwPowMult = 1.35
    gwRateMult = 1
    
    throwPow = 2
    throwRate = 1.4
    throwImpact = 6
    throwLunge = 1
    throwCost = 2
    throwSpeed = 10
    
    anim[1] = weaponHack    //Basic Attack
    anim[6] = weaponStabUp //Special 2h   
    anim[8] = weaponEngarde   //Special Idle
    
    animHold[0] = weaponSlashHold//Basic Hold Anim (basic+power)
    animHold[4] = weaponMegaLungeHold  //Special 2 hold
    meleeAttackMask[1] = spr_hack
    meleePowMult[1] = .6
    meleePowMult[2] = .8
    
    meleeRateMult[4] = 1.5
    meleeLungeMult[4] = 1.5
    meleePowMult[4] = 1.2
    
    meleeType[6] = dmgType.pierce
    meleePowMult[6] = 1
    meleeChargePowMult[6] = 1.4
    meleeSizeMult[6] = 1
    meleeImpactTypeMult[6] = 2
    meleeCostMult[6] = 1.2
    meleeLungeMult = 3
    meleePenMod[6] = 50
    meleeAttackMask[6] = spr_stab
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
    tooltip = "The bigger sword protects the smaller swords from big swords.  Bigger swords fight for justice and their friends."
    
    //Item Stats
    length = 35
    holdPoint = 15
    gwPoint = 2
    weight = 8
           
    //Weapon Stats
    meleePow = 1.7
    meleeRate = .7
    meleeImpact = 5
    meleeLunge = 2
    meleeSlow = .4
    meleeSize = 1.5
    meleeCost = 3
    meleePen = 0  
    
    gwPowMult = 1.4
    gwRateMult = 1.4
    
    throwPow = 2.2
    throwRate = 1.2
    throwImpact = 7
    throwLunge = 1
    throwCost = 3
    throwSpeed = 10
    

    anim[1] = weaponHack
    meleeAttackMask[1] = spr_hack
    break
}

#define specialSword
switch(argument0)
{
    case 0:     //Initialize 
    typeSword(0)
    
    //Core
    name = 'Swordstria'
    sprite_index = spr_swordstria
    tooltip = "Justia's sword of justice.  Best used to justly enact justice upon the unjust."
    
    //Item Stats
    length = 28
    holdPoint = 12
    gwPoint = 1
    weight = 5
    
    //Weapon Stats
    meleePow = 2
    meleeRate = 1.3
    meleeImpact = 5
    meleeLunge = 3
    meleeSlow = .2
    meleeSize = 1.3
    meleeCost = 1
    meleePen = 25  
    
    gwPowMult = 1.4
    gwRateMult = 1
    
    throwPow = 4
    throwRate = 1.6
    throwImpact = 7
    throwLunge = 1
    throwCost = 1
    throwSpeed = 15
    
    anim[1] = weaponHack
    meleeAttackMask[1] = spr_hack
    break
}