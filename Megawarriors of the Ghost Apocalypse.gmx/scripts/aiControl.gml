#define aiControl
if ((global.timer+responseStart) % (responseTime/responseMod) <= 1/global.frameRate){
    
    aiActionReset()
    aiMaster()
    
}

if (attackPattern = attackIdle){
    aiAction()
}
else if (attackPattern != attackIdle){
    aiAttackPattern()
}




#define aiInitialize
/*
called by charCreate
*/
player = false

responseStart = 0
responseMod = 1

attackPatRand = 0.4

responseTime = 1 
aiMasterListGreen[0] = actionIdle
aiMasterListYellow[0] = actionIdle
aiMasterListRed[0] = actionIdle

attackPattern = attackIdle
attackStarted = false
attackSpeed = 1

hasDodged = false

attackStep = 0

leader = noone
subordinate[0] = noone

currentAction = actionIdle
actionTargetX = 0
actionTargetY = 0
actionTargetId = noone

alertState = 'green'
hasBeenRed = 0
alertness = ds_priority_create()

hearing = 0

centerVisionRange = 0
sideVisionRange = 0


#define aiDestroy

if (leader = id){
    for (i = 0; i < array_length_1d(subordinate); i++){
        if(instance_exists(subordinate[i])){
            subordinate[i].leader = noone
            subordinate[i] = 0
        }
    }                    
}
else if (leader != noone && instance_exists(leader)){
    for (i = 0; i< array_length_1d(leader.subordinate); i++){
        if (leader.subordinate[i] = id && i != 0){
            leader.subordinate[i] = leader.subordinate[array_length_1d(leader.subordinate)-1]
        }
    }
    leader.subordinate[array_length_1d(leader.subordinate)-1] = 0
}           

if (ds_exists(alertness, ds_type_priority)){
    ds_priority_destroy(alertness)
}

#define aiActionReset
hasDodged = false

if (!instance_exists(actionTargetId) ||
         point_distance(x,y,actionTargetId.x,actionTargetId.y) < agroRange*metre ||
         actionTargetId.floorID.sprite_index == spr_grass){
    actionTargetId = noone
}
