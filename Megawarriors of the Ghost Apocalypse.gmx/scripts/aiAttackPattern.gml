#define aiAttackPattern
if (attackStarted == true){
    attackPatternStep()
}
else{
    attackPatternStart(attackPattern)
    attackStarted = true
}



#define attackPatternStart
attackStep = 0
attackDelay = 0
attackIndex = argument0
script_execute(attackIndex,attackStep)


#define attackPatternStep
attackDelay -= attackSpeed/global.frameRate

if (attackDelay <=0){
    attackStep += 1
    script_execute(attackIndex,attackStep)
}



#define attackReset
attackStarted = false

attackIndex = attackIdle
attackPattern = attackIdle
attackStep = 0





#define attackIdle

#define attackDodgeStep


switch(argument0)
{
    case 0:
        attackDelay = 0.2
    break

    case 1:
        var moveT = (movement*moveMult)
        moveT = moveT/(1+moveDT)
        
        hspd = -lengthdir_x(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
        vspd = -lengthdir_y(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
        
        
        dodgeRoll(facing +30 + random(300))
        attackDelay = 0.33
    break
    
    case 2:
        attackReset()
    break
    
}


/*
var moveT = (movement*moveMult)
moveT = moveT/(1+moveDT)

hspd = -lengthdir_x(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
vspd = -lengthdir_y(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))


dodgeRoll(facing +30 + random(300))

#define attackPowerAttack
throwKey = false

switch(argument0)
{
    case 0:
        useItem(1,0)
        attackDelay = 1.25
    break

    case 1:
        useItem(1,1)
        attackDelay = 0.25
    break
    
    case 2:
        attackReset()
    break
}

#define attackCombo
throwKey = false
if (instance_exists(actionTargetId)){
    switch(argument0)
    {
        case 0:
            useItem(1,0)
            attackDelay = 0.6
        break
    
        case 1:
            useItem(1,1)
            attackDelay = 0.35
        break
        
        case 2:
            targetX = actionTargetId.x
            targetY = actionTargetId.y
            useItem(1,0)
            attackDelay = 0.15
        break
        
        case 3:
            targetX = actionTargetId.x
            targetY = actionTargetId.y
            useItem(1,1)
            attackDelay = 0.35
        break
        
        case 4:
            targetX = actionTargetId.x
            targetY = actionTargetId.y
            useItem(1,0)
            attackDelay = 0.15
        break
        
        case 5:
            targetX = actionTargetId.x
            targetY = actionTargetId.y
            useItem(1,1)
            attackDelay = 1
        break
        
        case 6:
            attackReset()
        break
    }
}
#define attackBasic
throwKey = false

if (instance_exists(actionTargetId)){
    switch(argument0)
    {
        case 0:
            useItem(1,0)
            attackDelay = 0.6
        break
    
        case 1:
            useItem(1,1)
            attackDelay = 0.35
        break
        
        case 2:
            attackReset()
        break
    }
}
#define attackJab
throwKey = false

if (instance_exists(actionTargetId)){
    switch(argument0)
    {
        case 0:
            useItem(1,0)
            attackDelay = 0.45
        break
    
        case 1:
            useItem(1,1)
            attackDelay = 0.8
        break
        
        case 2:
            attackReset()
        break
    }
}
