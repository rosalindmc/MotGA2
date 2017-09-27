#define animationStart
//animationStart(anim,track)
//track0 = movement
//track 1 and 2 are hands 1 and 2
animStep[argument1] = 0
animIndex[argument1] = argument0
script_execute(argument0,0,argument1)

#define animEndStep
//animEndStep()
if argument0 != 0
{
    //Soft tween hand anims
    handDist[argument0] += (handDistDest[argument0]-handDist[argument0])/ceil(global.frameRate*animDelay[argument0])
    handDir[argument0] += (handDirDest[argument0]-handDir[argument0])/ceil(global.frameRate*animDelay[argument0])
    handHeight[argument0] += (handHeightDest[argument0]-handHeight[argument0])/ceil(global.frameRate*animDelay[argument0])
    itemRot[argument0] += (itemRotDest[argument0]-itemRot[argument0])/ceil(global.frameRate*animDelay[argument0])
    itemZRot[argument0] += (itemZRotDest[argument0]-itemZRot[argument0])/ceil(global.frameRate*animDelay[argument0])
}

animDelay[argument0] -= animSpeed[argument0]/global.frameRate

if animDelay[argument0] <= 0
{
    animStep[argument0] += sign(animSpeed[argument0])    
    script_execute(animIndex[argument0],animStep[argument0],argument0)
}


#define animationReset
animStep[argument0] = 0

switch(argument0)
{
    case 0:
    animIndex[argument0] = humanoid(3)  //Replace with animType(3)
    script_execute(animIndex[argument0],0,argument0)
    break
    
    case 1:
    case 2:
    animIndex[argument0] = weaponIdle   //Replace with checking weapon anim
    script_execute(animIndex[argument0],0,argument0)
    break
}