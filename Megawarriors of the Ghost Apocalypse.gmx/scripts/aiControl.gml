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

responseStart = 0
responseMod = 1

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
ds_priority_destroy(alertness)
#define aiActionReset
hasDodged = false

if (!instance_exists(actionTargetId)){
    actionTargetId = noone
}
