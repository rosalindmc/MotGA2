#define aiAction
script_execute(currentAction,2)

#define actionIdle
//argument0 is the check/set order/run switch
switch (argument0){
case 0:
    return 1;
    break;
    
case 1:
    currentAction = actionIdle
    break;
    
case 2:
    break;
}

#define actionMove
/*
argument0 is the check/set order/run switch

*/
switch (argument0){
case 0:
    if(actionTargetX !=0 && actionTargetY != 0){
        //pathFind to the spot and check if you can get there
        actionTargetX = ceil(x + irandom(4*metre) - 2*metre)
        actionTargetY = ceil(y + irandom(4*metre) - 2*metre)
        
        return 1;
    }
    else{
        actionTargetX = ceil(x + irandom(4*metre) - 2*metre)
        actionTargetY = ceil(y + irandom(4*metre) - 2*metre)  
             
        
        return 0;  
    }
    
    break;
    
case 1:
    currentAction = actionMove
    break;
    
case 2:

    
    if(point_distance(x,y,actionTargetX,actionTargetY) > 1*metre && canMove = true){
        var moveT = (movement*moveMult)
        moveT = moveT/(1+moveDT)
        
        hspd = lengthdir_x(moveT,point_direction(x,y,actionTargetX,actionTargetY))
        vspd = lengthdir_y(moveT,point_direction(x,y,actionTargetX,actionTargetY))
        
         
    }
    
    targetX = actionTargetX
    targetY = actionTargetY
    
    break;
}

#define actionDistance
//argument0 is the check/set order/run switch
switch (argument0){
case 0:
    if(actionTargetId != noone && point_distance(x,y,actionTargetId.x,actionTargetId.y) < 4*metre /*&& (life < lifeMax/2 || stam < stamMax/2)*/){
        //pathFind to the spot and check if you can get there
        
        return 1;
    }
    else{
        actionTargetId = global.pc
        return 0;
    }
    
    break;
    
case 1:
    currentAction = actionDistance
    break;
    
case 2:

    if (canMove){
        if((actionTargetId.charge[1]>1 || actionTargetId.charge[2]>1) && hasDodged != true){
            attackPattern = attackDodgeStep
            hasDodged = true
        }
        else if (actionTargetId.stam < actionTargetId.stamMax/2) {
            attackPattern =  attackPowerAttack
            
        }
        else{
            var moveT = (movement*moveMult)
            moveT = moveT/(1+moveDT)
            
            if (point_distance(x,y,actionTargetId.x,actionTargetId.y)<3*metre){
            
            hspd = -lengthdir_x(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
            vspd = -lengthdir_y(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
            
            }
        }
    }
    
    
    targetX = actionTargetId.x
    targetY = actionTargetId.y
    
    break;
}

#define actionEquip
//argument0 is the check/set order/run switch
switch (argument0){
case 0:

//find the closest thing that it's able to pick up

    tempWep = noone;

    if(inventory[0] == noone){
    
        tempDist = 5*metre;
        with(obj_interactable){
            if(useType == pickUp){
                if(point_distance(x,y,other.x,other.y) < other.tempDist){
                    other.tempDist = point_distance(x,y,other.x,other.y);
                    other.tempWep = id;
                    
                }
            }
        }
    }
    
    if(tempWep != noone){
        actionTargetId = tempWep;
        return 1;
    }
    else{
        return 0;
    }
    break;
    
case 1:

    currentAction = actionEquip;
    break;
    
case 2:
//go to the pickupable thing
    if(inventory[0] == noone && instance_exists(actionTargetId)){
        targetX = actionTargetId.x;
        targetY = actionTargetId.y;
    
        if (point_distance(x,y,actionTargetId.x,actionTargetId.y) < 2*metre){
            pointInteract = actionTargetId;
            interact();
            pointInteract = noone;
            actionTargetId = noone;
        }
        
        else if (canMove){
        
        var moveT = (movement*moveMult)
        moveT = moveT/(1+moveDT)
        
        hspd = lengthdir_x(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
        vspd = lengthdir_y(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
        }
    
        break;
    }
    else{
        responseStart = global.timer + responseTime/4
    }
}

#define actionChase
/*
argument0 is the check/set order/run switch

*/
switch (argument0){
case 0:
    if(actionTargetId != noone && point_distance(x,y,actionTargetId.x,actionTargetId.y) < 10*metre){
        //pathFind to the spot and check if you can get there
        return 1;
    }
    else{
        actionTargetId = global.pc
        
        return 0;           
    }
    
    break;
    
case 1:
    currentAction = actionChase
    break;
    
case 2:

    if (canMove && point_distance(x,y,actionTargetId.x,actionTargetId.y) > 1*metre){
        var moveT = (movement*moveMult)
        moveT = moveT/(1+moveDT)
        
        hspd = lengthdir_x(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
        vspd = lengthdir_y(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
    
    }
    
    if(actionTargetId != noone && point_distance(x,y,actionTargetId.x,actionTargetId.y) < 3*metre){
        attackPattern =  choose(attackCombo,attackPowerAttack)
    }

    targetX = actionTargetId.x
    targetY = actionTargetId.y   
    
    break;
}

#define actionAttack

#define actionAttackTarget

#define actionPatrol

#define actionChaseAlert

#define actionCover

#define actionHide

#define actionSearch

#define actionFollowOrders

#define actionOrderAttack

#define actionOrderFormation

#define actionOrderGuard
