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

#define actionMoveRand
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
    currentAction = actionMoveRand
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
    if(actionTargetId != noone && point_distance(x,y,actionTargetId.x,actionTargetId.y) < 6*metre /*&& (life < lifeMax/2 || stam < stamMax/2)*/){
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
        else if (point_distance(x,y,actionTargetId.x,actionTargetId.y) < 4*metre){
            var moveT = (movement*moveMult)
            moveT = moveT/(1+moveDT)
            moveT = moveT/2
            
            if (point_distance(x,y,actionTargetId.x,actionTargetId.y)<3*metre){
            
            hspd = -lengthdir_x(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
            vspd = -lengthdir_y(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
            
            }
        }
        else{
            var moveT = (movement*moveMult)
            moveT = moveT/(1+moveDT)
            moveT = moveT
            
            if (point_distance(x,y,actionTargetId.x,actionTargetId.y)>3*metre){
            
            hspd = lengthdir_x(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
            vspd = lengthdir_y(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
            
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
    if(actionTargetId != noone && point_distance(x,y,actionTargetId.x,actionTargetId.y) < 8*metre){
        //pathFind to the spot and check if you can get there
        return 1;
    }
    else{
        //actionTargetId = global.pc
        
        return 0;           
    }
    
    break;
    
case 1:
    currentAction = actionChase
    break;
    
case 2:

    if (canMove && point_distance(x,y,actionTargetId.x,actionTargetId.y) > 4*metre){
        var moveT = (movement*moveMult)
        moveT = moveT/(1+moveDT)
        
        hspd = lengthdir_x(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
        vspd = lengthdir_y(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
    
    }

    targetX = actionTargetId.x
    targetY = actionTargetId.y   
    
    break;
}

#define actionAttackCorral
/*
argument0 is the check/set order/run switch

*/
switch (argument0){
case 0:
    if(actionTargetId != noone && point_distance(x,y,actionTargetId.x,actionTargetId.y) < 5*metre && stam == stamMax && staggered != true){
        //pathFind to the spot and check if you can get there
        return 1;
    }
    else if (point_distance(x,y,global.pc.x,global.pc.y)<10*metre){
        actionTargetId = global.pc
        return 0;
    }
    else{        
        return 0;           
    }
    
    break;
    
case 1:
    currentAction = actionAttackCorral
    break;
    
case 2:

    if (canMove && point_distance(x,y,actionTargetId.x,actionTargetId.y) > 4.5*metre){
        var moveT = (movement*moveMult)
        moveT = moveT/(1+moveDT)
        
        hspd = lengthdir_x(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
        vspd = lengthdir_y(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
    
    }
    else if (point_distance(x,y,actionTargetId.x,actionTargetId.y)<1.5*metre){
            
        attackPattern =  attackJab
        lastAttack = global.timer
        
    }
    else{
        
        var moveT = (movement*moveMult)
        moveT = moveT/(1+moveDT)
        moveT = moveT/4
        
        hspd = lengthdir_x(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
        vspd = lengthdir_y(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
    }
    
    if (actionTargetId != noone && point_distance(x,y,actionTargetId.x,actionTargetId.y) < 4*metre 
                && ((actionTargetId.stam <= actionTargetId.stamMax-1) 
                || (actionTargetId.handItem[1] == noone && actionTargetId.handItem[2] == noone))
                /*|| actionTargetId.staggered*/){
                
        attackPattern =  choose(attackCombo,attackPowerAttack)
        lastAttack = global.timer
    }
    else if(global.timer >= (lastAttack+10)%30){
        attackPattern =  attackBasic
        lastAttack = global.timer
    }
    
    targetX = actionTargetId.x
    targetY = actionTargetId.y   
    
    break;
}

#define actionAttackCareful
/*
argument0 is the check/set order/run switch

*/
switch (argument0){
case 0:
    if(actionTargetId != noone && point_distance(x,y,actionTargetId.x,actionTargetId.y) < 5*metre && stam == stamMax && staggered != true){
        //pathFind to the spot and check if you can get there
        return 1;
    }
    else if (point_distance(x,y,global.pc.x,global.pc.y)<10*metre){
        actionTargetId = global.pc
        return 0;
    }
    else{        
        return 0;           
    }
    
    break;
    
case 1:
    currentAction = actionAttackCareful
    break;
    
case 2:

    if (canMove && point_distance(x,y,actionTargetId.x,actionTargetId.y) > 4*metre){
        var moveT = (movement*moveMult)
        moveT = moveT/(1+moveDT)
        
        hspd = lengthdir_x(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
        vspd = lengthdir_y(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
    
    }
    else if (point_distance(x,y,actionTargetId.x,actionTargetId.y)<2.5*metre){
            
            var moveT = (movement*moveMult)
            moveT = moveT/(1+moveDT)      
            
            
            hspd = -lengthdir_x(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
            vspd = -lengthdir_y(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
            
    }
    
    if (actionTargetId != noone && point_distance(x,y,actionTargetId.x,actionTargetId.y) < 3*metre 
                && ((actionTargetId.stam <= actionTargetId.stamMax-1) 
                || (actionTargetId.handItem[1] == noone && actionTargetId.handItem[2] == noone))
                /*|| actionTargetId.staggered*/){
                
        attackPattern =  choose(attackCombo,attackPowerAttack)
        lastAttack = global.timer
    }
    else if(global.timer >= (lastAttack+10)%30){
        attackPattern =  attackBasic
        lastAttack = global.timer
    }
    
    targetX = actionTargetId.x
    targetY = actionTargetId.y   
    
    break;
}

#define actionAttackTarget

#define actionPatrol

#define actionChaseAlert

#define actionCover

#define actionHide

#define actionSearch

#define actionFollowOrder

#define actionOrderAttack

#define actionOrderFormation

#define actionAttackRanged
/*
argument0 is the check/set order/run switch

*/
switch (argument0){
case 0:
    
    actionTargetId = global.pc
    
    if(stam == stamMax && staggered != true && point_distance(x,y,actionTargetId.x,actionTargetId.y) > 5*metre){
        //pathFind to the spot and check if you can get there
        return 1;
    }
    else{        
        return 0;           
    }
    
    break;
    
case 1:
    currentAction = actionAttackRanged
    break;
    
case 2:

    if (canMove && point_distance(x,y,actionTargetId.x,actionTargetId.y) > 5*metre){
        moveMult = 0.5
        var moveT = (movement*moveMult)
        moveT = moveT/(1+moveDT)
        moveMult = 1.0
        
        hspd = -lengthdir_x(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
        vspd = -lengthdir_y(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
    
    }
    
    if(global.timer >= (lastAttack+10)%30){
        attackPattern =  attackPowerAttack
        lastAttack = global.timer
    }
    
    targetX = actionTargetId.x
    targetY = actionTargetId.y   
    
    break;
}

#define actionFlee
/*
argument0 is the check/set order/run switch

*/
switch (argument0){
case 0:
    if(actionTargetId != noone && point_distance(x,y,actionTargetId.x,actionTargetId.y) < 5*metre){
        //pathFind to the spot and check if you can get there
        return 1;
    }
    else{        
        return 0;           
    }
    
    break;
    
case 1:
    currentAction = actionFlee
    break;
    
case 2:

    if (canMove && point_distance(x,y,actionTargetId.x,actionTargetId.y) < 10*metre){
        var moveT = (movement*moveMult)
        moveT = moveT/(1+moveDT)
        
        hspd = -lengthdir_x(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
        vspd = -lengthdir_y(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
    }
    
    targetX = x+(actionTargetId.x-x)
    targetY = y+(actionTargetId.y-y)   
    
    break;
}

#define actionJoinFormation
/*
argument0 is the check/set order/run switch

*/
switch (argument0){
case 0:


    if (leader != noone){
        return 1;
    }
    else if (leader == noone){
    
        with(obj_char){
            if (id != other.id && joinsFormation == true && point_distance(x,y,other.x,other.y) < 7*metre){
                if (leader == noone || leader == id){
                    other.leader = id
                    leader = id
                    if (subordinate [0] == noone){
                        subordinate[0] = other
                    }
                    else{
                        subordinate[array_length_1d(subordinate)] = other
                    }
                    return 0;
                }
                else{
                    other.leader = leader
                    leader.subordinate[array_length_1d(leader.subordinate)] = other
                    return 0;
                }
            }
            else if (life < 0){
                if (leader = id){
                    for (i = 0; i< array_length_1d(subordinate); i++){
                        subordinate[i].leader = noone
                    }                    
                }
                else if (leader != noone){
                    for (i = 0; i< array_length_1d(leader.subordinate); i++){
                        if (leader.subordinate[i] = id){
                            leader.subordinate[i] = subordinate[array_length_1d(leader.subordinate)]
                            leader.subordinate[array_length_1d(leader.subordinate)] = 0
                        }
                    }
                }           
            }
        }
        
        
    }
    else{        
        return 0;           
    }
    
    break;
    
case 1:
    currentAction = actionJoinFormation
    
    actionTargetId = global.pc
    
    break;
    
case 2:
    if (subordinate[0] != noone){
        var tempX = actionTargetId.x - x
        var tempY = actionTargetId.y - y
        var tempHold
        
        tempX = tempX/point_distance(x,y,actionTargetId.x,actionTargetId.y)
        tempY = tempY/point_distance(x,y,actionTargetId.x,actionTargetId.y)
        
        actionTargetX = x + tempX
        actionTargetY = y + tempY
        
        tempHold = tempX
        tempX = 1.5*metre * tempY
        tempY = -1.5*metre * tempHold
        
        
        
        for (i = 0; i< array_length_1d(subordinate); i++){
            
            if (i = 0){
                subordinate[i].actionTargetX = x + tempX
                subordinate[i].actionTargetY = y + tempY        
            }
            else if (i = 1){
                subordinate[i].actionTargetX = x - tempX
                subordinate[i].actionTargetY = y - tempY 
            }
            else if (i % 2 = 0){
                subordinate[i].actionTargetX = subordinate[i-2].actionTargetX + tempX
                subordinate[i].actionTargetY = subordinate[i-2].actionTargetY + tempY
            }
            else if (i % 2 = 1){
                subordinate[i].actionTargetX = subordinate[i-2].actionTargetX - tempX
                subordinate[i].actionTargetY = subordinate[i-2].actionTargetY - tempY
            }
        
        }
        
    }
    

    if (canMove && point_distance(x,y,actionTargetX,actionTargetY) > 0.5*metre){
        var moveT = (movement*moveMult)
        moveT = moveT/(1+moveDT)
        
        hspd = lengthdir_x(moveT,point_direction(x,y,actionTargetX,actionTargetY))
        vspd = lengthdir_y(moveT,point_direction(x,y,actionTargetX,actionTargetY))
    }
    else if(point_distance(x,y,actionTargetId.x,actionTargetId.y) < 5*metre){        
        currentAction = actionAttackCorral
    }
    else if (canMove && point_distance(x,y,actionTargetId.x,actionTargetId.y) > 5*metre && point_distance(x,y,actionTargetId.x,actionTargetId.y) < 10*metre){
        var moveT = (movement*moveMult)
        moveT = moveT/(1+moveDT)
        moveT = moveT/5
        
        var tempX = actionTargetId.x - x
        var tempY = actionTargetId.y - y
        var tempHold
        
        tempX = tempX/point_distance(x,y,actionTargetId.x,actionTargetId.y)
        tempY = tempY/point_distance(x,y,actionTargetId.x,actionTargetId.y)
        
        actionTargetX = x + tempX
        actionTargetY = y + tempY
        
        hspd = lengthdir_x(moveT,point_direction(x,y,actionTargetX,actionTargetY))
        vspd = lengthdir_y(moveT,point_direction(x,y,actionTargetX,actionTargetY))
    }
    
    targetX = actionTargetId.x
    targetY = actionTargetId.y   
    
    break;
}