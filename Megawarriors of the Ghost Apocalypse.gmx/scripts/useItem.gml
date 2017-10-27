#define useItem
//Run the use script of the item in hand argument0
//Run the second use script if right clicking w/ two hands
//Input argument1 to script for press vs release

if argument1 = 0
{
    if clashing = true or ds_list_size(stuck) > 0
    {
        interactKeyMash(argument0)
        exit;
    }
    if sticking != 0 and (argument0 = sticking or sticking = 3) 
    {
        interactKeyMash(argument0)
        exit;
    }
}

if argument1 = 0    //Start an action based on context
{
    if argument0 = 2 and grappling = true
    {
        throw(argument0,argument1)
    }
    else if throwKey = true
    {
        throw(argument0,argument1)
    }
    else
    {
        if handItem[argument0] != noone
        {
            script_execute(handItem[argument0].useScript[min(1+greatWeapon,argument0)],argument0,argument1)
        }
        else
        {
            //Add unarmed punch anim later
        }
    }
}
else
{
    if argument0 = 2 and grappling = true
    {
        throw(argument0,argument1)
    }
    else
    {
        if handItem[argument0] != noone
        {
            script_execute(handItem[argument0].useScript[min(1+greatWeapon,argument0)],argument0,argument1)
        }
    }
}


#define melee
switch(argument1)
{
    case 0:     //Click
    if canAttack = true and (charge[min(argument0,2-greatWeapon)] = 0 or (sweetSpot = true and fumble = false)) and stam >= 0 and fatigued = false
    {
        //Begin Hold
        charge[min(argument0,2-greatWeapon)] = 1
        fumble = false
        hold[min(argument0,2-greatWeapon)] = 1
        stamDelay = max(stamDelay,1)
        
        //Combo Flip
        if sweetSpot = true
        {
            meleeSwing[min(argument0,2-greatWeapon)] *= -1
        }
        
        //Start Hold Animation as determined by weapon and context
        if argument0 = 2 and greatWeapon = true and altAttackKey = true
        {
            //Alt Attack
            queuedAnim[1] = 6
            animationStart(handItem[1].animHold[4],1)
        }
        else if argument0 = 2 and greatWeapon = true
        {
            //Alt Attack
            queuedAnim[1] = 3
            animationStart(handItem[1].animHold[1],1)
        }
        else if recentDodge != 0 or dodgeTimer != 0
        {
            //Roll Attack
            queuedAnim[argument0] = 4
            animationStart(handItem[argument0].animHold[2],argument0)
        }
        else if altAttackKey = true
        {
            //Alt Attack
            queuedAnim[argument0] = 7
            animationStart(handItem[argument0].animHold[5],argument0)
        }
        else if point_distance(x,y,targetX,targetY) < (handItem[argument0].length/2)+metre
        {
            //Close Attack
            queuedAnim[argument0] = 5
            animationStart(handItem[argument0].animHold[3],argument0)
        }
        else
        {
            //Normal Attack
            queuedAnim[argument0] = 1
            animationStart(handItem[argument0].animHold[0],argument0)
        }
        
        if argument0 = 1 or greatWeapon = true
        {
            applyStatus(id,wepSlow1,handItem[argument0].meleeSlow*handItem[argument0].meleeSlowMult[queuedAnim[min(argument0,2-greatWeapon)]]*(1+((greatWeapon*handItem[argument0].gwSlowMult)-greatWeapon)),2,id,false)
        }
        else
        {
            applyStatus(id,wepSlow2,handItem[argument0].meleeSlow*handItem[argument0].meleeSlowMult[queuedAnim[argument0]]*(1+((greatWeapon*handItem[argument0].gwSlowMult)-greatWeapon)),2,id,false)    
        }
        
    }
    else
    {
        fumble = true
    }
    break
    
    case 1:     //Release
    if hold[min(argument0,2-greatWeapon)] != 0 and dodgeTimer = 0 and canAttack = true
    {
        if animIndex[min(argument0,2-greatWeapon)] = throwHold
        {
            //Play corresponding attack anim   
            throwAttack(min(argument0,2-greatWeapon)) 
        }
        else
        {
            //Play corresponding attack anim   
            meleeAttack(min(argument0,2-greatWeapon))
        }     
    }
    break
}

#define meleeAttack
//Play relevent animation
//Set Stamina Delay
//Spend Stamina

//Weight Multiplier
wM = 1+max(0,(handItem[argument0].weight-might-(greatWeapon*ceil(might*.5)))*.2)

//Stamina Cost
if rhythm = argument0
{
    spendStamina(.5*wM*handItem[argument0].meleeCost*handItem[argument0].meleeCostMult[queuedAnim[argument0]]/(1+(sweetSpot*perfectTimeMod))*(1+((greatWeapon*handItem[argument0].gwCostMult)-greatWeapon)),1)
}
else
{
    spendStamina(wM*handItem[argument0].meleeCost*handItem[argument0].meleeCostMult[queuedAnim[argument0]]/(1+(sweetSpot*perfectTimeMod))*(1+((greatWeapon*handItem[argument0].gwCostMult)-greatWeapon)),1)
}

//Anim and Essentials
sweetSpotBonus = sweetSpot
sweetSpot = false
strike[argument0] = 1
hold[argument0] = 0
animationStart(handItem[argument0].anim[queuedAnim[argument0]],argument0)

//Lunge
hspd += lengthdir_x((4+power(charge[argument0]
*handItem[argument0].meleeLungeMult[queuedAnim[argument0]]
*handItem[argument0].meleeLunge*(1+((greatWeapon
*handItem[argument0].gwLungeMult)-greatWeapon))
,.9)),facing)
vspd += lengthdir_y((4+power(charge[argument0]*handItem[argument0].meleeLungeMult[queuedAnim[argument0]]*handItem[argument0].meleeLunge*(1+((greatWeapon*handItem[argument0].gwLungeMult)-greatWeapon)),.9)),facing)

if charge[argument0] = 2
{
    animationStart(humanoidFlinchForward,0)
}

moveTimer = .2
canMove = false

if argument0 = 1
{
    applyStatus(id,wepSlow1,handItem[argument0].meleeSlow*handItem[argument0].meleeSlowMult[queuedAnim[argument0]]*(1+((greatWeapon*handItem[argument0].gwSlowMult)-greatWeapon)),.5,id,false)
}
else
{
    applyStatus(id,wepSlow2,handItem[argument0].meleeSlow*handItem[argument0].meleeSlowMult[queuedAnim[argument0]]*(1+((greatWeapon*handItem[argument0].gwSlowMult)-greatWeapon)),.5,id,false)    
}


#define meleeHit
//Weight Multiplier
wM = 1+max(0,(handItem[argument0].weight-might-(greatWeapon*ceil(might*.5)))*.2)

// Make melee collider
strike[argument0] = 0
with(handItem[argument0])
{    
    i = instance_create(owner.x+lengthdir_x((length/2)+owner.itemHoldAdjust[argument0]+owner.handDist[argument0]+holdPoint,owner.facing),owner.y+lengthdir_y((length/2)+owner.itemHoldAdjust[argument0]+owner.handDist[argument0]+holdPoint,owner.facing),obj_meleeCollider)
    i.owner = owner
    i.itemOwner = id
    i.originX = owner.x
    i.originY = owner.y
    i.dist = (length/2)+owner.handDist[argument0]+holdPoint+owner.itemHoldAdjust[argument0]
    i.image_angle = owner.facing
    i.dmgType = meleeType[argument1]
    i.dmg = meleePow*meleePowMult[argument1]*(1+((owner.charge[argument0]-1)*meleeChargePowMult[argument1]))*(1+((owner.greatWeapon*gwPowMult)-owner.greatWeapon))*owner.damageMod*(1+(owner.perfectTimeDmgMod*owner.sweetSpotBonus))/other.wM
    i.sweetSpot = owner.sweetSpotBonus
    i.impact = meleeImpact*meleeImpactMult[argument1]*(1+((owner.charge[argument0]-1)*meleeChargePowMult[argument1]))*(1+((owner.greatWeapon*gwImpactMult)-owner.greatWeapon))*owner.impactMod
    i.pen = (meleePen+owner.penMod+meleePenMod[argument1])
    i.z = z
    i.canProvokeClash = true
    i.impactType = meleeImpactTypeMult[argument1]/other.wM
    i.puntMult = meleePuntMult[argument1]
    i.sticky = true
    i.sprite_index = meleeAttackMask[argument1]
    i.image_yscale = meleeSize*meleeSizeMult[argument1]*owner.meleeSwing[argument0]*(1+((owner.greatWeapon*gwSizeMult)-owner.greatWeapon))
    i.image_xscale = meleeSize*meleeSizeMult[argument1]*(1+((owner.greatWeapon*gwSizeMult)-owner.greatWeapon))
}
rhythm = 3-argument0

#define meleeEnd
charge[argument0] = 0
animationReset(argument0)

if charge[1] = 0 and charge[2] = 0
{
    rhythm = 0
}

#define perfectHitSheen
if fumble = false and player = true
{
    with(handItem[argument0])
    {    
        createParticle(owner.x+lengthdir_x(length+owner.handDist[argument0],image_angle),owner.y+lengthdir_y(length+owner.handDist[argument0],image_angle),z,1,partSheen,0)
    }
}

#define drinkPotion
switch(argument1){
case 0:
    //make a gulping noise
break;

case 1:
    //Potion Effect
    life = min(life+3,lifeMax);
    
    //Destroy Potion
    with(handItem[argument0])
    {
        instance_destroy();
    }
    handItem[argument0] = noone;
    inventory[handItemSlot[argument0]] = noone;
    handItemSlot[argument0] = -1
break;
}

#define interactKeyMash
if clashing = true
{
    //Add progress
    interactProgress += .2*(weight/clashingWith.weight)
    animDelay[1] = 0.01
    animDelay[2] = 0.01
    
    //Win Clash
    if interactProgress >= clashingWith.interactProgress+1
    {
        if handItem[argument0] != noone
        { 
            charge[min(argument0,2-greatWeapon)] = 2
            queuedAnim[min(argument0,2-greatWeapon)] = 5
            meleeAttack(min(argument0,2-greatWeapon))
        }
        stam = stamMax
        clashingWith.stability = 0
        endClash()
    }
}
else if sticking != 0 and (sticking = argument0 or sticking = 3)
{
    //Add progress
    interactProgress += 2*(weight/handItem[argument0].weight)
    animDelay[1] = 0.01
    animDelay[2] = 0.01
    
    //Unstick
    if interactProgress >= 2
    {
        if instance_exists(sticking)
        {
            if handItem[argument0].stuckIn.alive = true && !handItem[argument0].stuckIn = id
            {
                damageChar(handItem[argument0].stuckIn,2,dmgType.rend,true,id)
                applyStatus(handItem[argument0].stuckIn,bleed,.5,6,id,true)
            }
        }
        unstickOther()
        
        hspd = lengthdir_x(4,facing+180)
        vspd = lengthdir_y(4,facing+180)
        canMove = false
        moveTimer = .2
        animationStart(humanoidFlinchBackward,0)
    }
}
else if ds_list_size(stuck) > 0
{
    //Add progress
    interactProgress += .2      //Maybe make it total all the weights of all the weapons stuck in you?

    animDelay[1] = 0.01
    animDelay[2] = 0.01
    
    //Win Clash
    if interactProgress >= 2
    {
        unstickSelf()
    }
}