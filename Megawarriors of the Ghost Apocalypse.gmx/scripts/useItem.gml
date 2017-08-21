#define useItem
//Run the use script of the item in hand argument0
//Run the second use script if right clicking w/ two hands
//Input argument 1 to script for press vs release

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
    else if queuedAnim[argument0] = 7
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
    if canAttack = true and (charge[min(argument0,2-greatWeapon)] = 0 or (sweetSpot = true and fumble = false)) and stam >= 1
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
        if argument0 = 2 and greatWeapon = true
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
        else if point_distance(x,y,targetX,targetY) < handItem[argument0].length+10 //Replace with var
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
        
        //moveMult = min(1-handItem[argument0].meleeSlow)
    }
    else
    {
        fumble = true
    }
    break
    
    case 1:     //Release
    if hold[min(argument0,2-greatWeapon)] != 0 and dodgeTimer = 0 and canAttack = true
    {
        //Play corresponding attack anim   
        meleeAttack(min(argument0,2-greatWeapon))     
    }
    break
}

#define meleeAttack
//Play relevent animation
//Set Stamina Delay
//Spend Stamina

//Stamina Cost
spendStamina(handItem[argument0].meleeCost*handItem[argument0].meleeCostMult[queuedAnim[argument0]]/(1+(sweetSpot*perfectTimeMod))*(1+((greatWeapon*handItem[argument0].gwCostMult)-greatWeapon)),1)

//Anim and Essentials
sweetSpotBonus = sweetSpot
sweetSpot = false
strike[argument0] = 1
hold[argument0] = 0
animationStart(handItem[argument0].anim[queuedAnim[argument0]],argument0)

//Lunge
hspd += lengthdir_x((4+(charge[argument0]*handItem[argument0].meleeLungeMult[queuedAnim[argument0]]*handItem[argument0].meleeLunge*(1+((greatWeapon*handItem[argument0].gwLungeMult)-greatWeapon)))),facing)
vspd += lengthdir_y((4+(charge[argument0]*handItem[argument0].meleeLungeMult[queuedAnim[argument0]]*handItem[argument0].meleeLunge*(1+((greatWeapon*handItem[argument0].gwLungeMult)-greatWeapon)))),facing)

if charge[argument0] = 2
{
    animationStart(humanoidFlinchForward,0)
}

moveTimer = .2
canMove = false

#define meleeHit
// Make melee collider
strike[argument0] = 0
with(handItem[argument0])
{    
    i = instance_create(owner.x+lengthdir_x(length+owner.handDist[argument0],owner.facing),owner.y+lengthdir_y(length+owner.handDist[argument0],owner.facing),obj_meleeCollider)
    i.owner = owner
    i.originX = x
    i.originY = y
    i.dist = (length/2)+owner.handDist[argument0]+holdPoint
    i.image_angle = owner.facing
    i.dmgType = meleeType[argument1]
    i.dmg = meleePow*meleePowMult[argument1]*(1+((owner.charge[argument0]-1)*meleeChargePowMult[argument1]))*(1+((owner.greatWeapon*gwPowMult)-owner.greatWeapon))*owner.damageMod*(1+(owner.perfectTimeDmgMod*owner.sweetSpotBonus))
    i.sweetSpot = owner.sweetSpotBonus
    i.impact = meleeImpact*meleeImpactMult[argument1]*(1+((owner.charge[argument0]-1)*.5))*(1+((owner.greatWeapon*gwImpactMult)-owner.greatWeapon))*owner.impactMod
    i.pen = (meleePen*owner.penMod)
    i.z = z
    i.sprite_index = meleeAttackMask[argument1]
    i.image_yscale = meleeSize*meleeSizeMult[argument1]*owner.meleeSwing[argument0]*(1+((owner.greatWeapon*gwSizeMult)-owner.greatWeapon))
    i.image_xscale = meleeSize*meleeSizeMult[argument1]*(1+((owner.greatWeapon*gwSizeMult)-owner.greatWeapon))
}

#define meleeEnd
charge[argument0] = 0
animationReset(argument0)

#define perfectHitSheen
if fumble = false
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
    with(handItem[argument0]){
        instance_destroy();
    }
    handItem[argument0] = noone;
    inventory[handItemSlot[argument0]] = noone;
    handItemSlot[argument0] = -1
break;
}