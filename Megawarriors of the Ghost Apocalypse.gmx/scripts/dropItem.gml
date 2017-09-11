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
    handItem[argument0] = noone
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
        charge[argument0] = 1
        fumble = false
        hold[argument0] = 1
        stamDelay = max(stamDelay,1)
        
        queuedAnim[1] = 7
        animationStart(throwHold,argument0)
    }
    break
    
    case 1:
    //Release Throw
    if hold[argument0] != 0 and dodgeTimer = 0 and canAttack = true
    {
        throwAttack(argument0)
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
            hspd = lengthdir_x(throwSpeed,other.facing)
            vspd = lengthdir_y(throwSpeed,other.facing)
            zspd += 5
            spin = throwSpin
        }
    }
    handItem[argument0] = noone
}
else    //Char Throw
{
    moveMult = 1    //Need a better system for handling this
    
    if charge[argument0] = 2    //if thrown instead of dropped
    {
        with(grappleTarg)
        {
            hspd = lengthdir_x(15,other.facing)
            vspd = lengthdir_y(15,other.facing)
            zspd += 10
            animationStart(humanoidFlinchBackward,0)
            moveTimer = 1
            canMove = false
        }
    }
    else
    {
        with(grappleTarg)
        {
            hspd = lengthdir_x(10,other.facing)
            vspd = lengthdir_y(10,other.facing)
            animationStart(humanoidFlinchBackward,0)
            moveTimer = .5
            canMove = false
        }
    }
    grappling = false
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