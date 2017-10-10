#define dropItem
//remove item from relevent slot
//make an interactable for object
//item loses owner


if handItem[argument0] != noone
{
    handItem[argument0].owner = noone
    i = instance_create(x,y,obj_interactable)
    i.owner = handItem[argument0]
    i.name = handItem[argument0].name
    i.useType = pickUp
    handItem[argument0].interactId = i
    inventory[handItemSlot[argument0]] = noone   
    if (greatWeapon = true)
    {
        switchItem(-1,1)
        switchItem(-1,2)
    }
    else
    {
        switchItem(-1,argument0)
    }
}

#define throw
//remove item from relevent slot
//make an interactable for object
//item loses owner

switch(argument1)
{
    case 0:
    if grappling = true or handItem[argument0] != noone
    {
        //Begin Hold
        charge[min(argument0,2-greatWeapon)] = 1
        fumble = false
        hold[min(argument0,2-greatWeapon)] = 1
        stamDelay = max(stamDelay,1)
        
        queuedAnim[min(argument0,2-greatWeapon)] = 7
        animationStart(throwHold,min(argument0,2-greatWeapon))
    }
    break
    
    case 1:
    //Release Throw
    if hold[min(argument0,2-greatWeapon)] != 0 and dodgeTimer = 0 and canAttack = true
    {
        throwAttack(min(argument0,2-greatWeapon))
    }
    break
}

#define throwAttack
if handItem[argument0] = noone
{
    //Stamina Cost
    spendStamina(1/(1+(sweetSpot*perfectTimeMod)),1)
    
    //Anim and Essentials
    sweetSpot = false
    hold[argument0] = 0
    animationStart(throwAnim,argument0)
}
else
{
    //Stamina Cost
    spendStamina(handItem[argument0].throwCost/(1+(sweetSpot*perfectTimeMod)),1)
    
    //Anim and Essentials
    sweetSpot = false
    hold[argument0] = 0
    animationStart(throwAnim,argument0)
    
    //Lunge
    hspd += lengthdir_x((4+(charge[argument0]*handItem[argument0].throwLunge)),facing)
    vspd += lengthdir_y((4+(charge[argument0]*handItem[argument0].throwLunge)),facing)
    
    if charge[argument0] = 2
    {
        animationStart(humanoidFlinchForward,0)
    }
    
    moveTimer = .2
    canMove = false
    
    if argument0 = 1
    {
        applyStatus(id,wepSlow1,handItem[argument0].meleeSlow*(1+((greatWeapon*handItem[argument0].gwSlowMult)-greatWeapon)),.5,id,false)
    }
    else
    {
        applyStatus(id,wepSlow2,handItem[argument0].meleeSlow*(1+((greatWeapon*handItem[argument0].gwSlowMult)-greatWeapon)),.5,id,false)
    }
}

#define throwRelease
//Finally release the item

//Item Throw
if handItem[argument0] != noone
{
    handItem[argument0].owner = noone
    i = instance_create(x,y,obj_interactable)
    i.owner = handItem[argument0]
    i.name = handItem[argument0].name
    i.useType = pickUp
    handItem[argument0].interactId = i
    
    if charge[argument0] = 2    //if thrown instead of dropped
    {
        with(handItem[argument0])
        {
            x = other.x+lengthdir_x((length/2)+other.itemHoldAdjust[argument0]+other.handDist[argument0]+holdPoint,other.facing)
            y = other.y+lengthdir_y((length/2)+other.itemHoldAdjust[argument0]+other.handDist[argument0]+holdPoint,other.facing)
            hspd = lengthdir_x(throwSpeed,other.facing)
            vspd = lengthdir_y(throwSpeed,other.facing)
            dir = other.facing
            dangerous = true
            sweetSpot = other.sweetSpot
            thrower = other
            zspd += 5
            spin = throwSpin
        }
    }
    inventory[handItemSlot[argument0]] = noone
    
    if (greatWeapon = true)
    {
        switchItem(-1,1)
        switchItem(-1,2)
        handItem[1] = noone
        handItem[2] = noone
        handItemSlot[1] = -1
        handItemSlot[2] = -1
    }
    else
    {
        switchItem(-1,argument0)
        handItem[argument0] = noone
        handItemSlot[argument0] = -1
    }
}
else    //Char Throw
{
    if charge[argument0] = 2    //if thrown instead of dropped
    {
        with(grappleTarg)
        {
            hspd = lengthdir_x(10,other.facing)
            vspd = lengthdir_y(10,other.facing)
            dangerous = true
            zspd += 5
            animationStart(humanoidFlinchBackward,0)
            moveTimer = 1.5
            canMove = false
            launcher = other
        }
    }
    else
    {
        with(grappleTarg)
        {
            hspd = lengthdir_x(10,other.facing)
            vspd = lengthdir_y(10,other.facing)
            dangerous = true
            animationStart(humanoidFlinchBackward,0)
            moveTimer = .5
            canMove = false
            launcher = other
        }
    }
    grappling = false
    moveMult += 0.5
    canRoll = true
    canInv = true
    if(instance_exists(grappleTarg)){
        grappleTarg.grappled = false
    }
    grappleTarg = -4
}

#define throwEnd
charge[argument0] = 0
animationReset(argument0)