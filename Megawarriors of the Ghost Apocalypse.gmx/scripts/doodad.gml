#define doodad


#define doodadInitialize
isoDepth(5)
image_index = irandom(2)
image_speed = 0
image_xscale = choose(-1,1)

corpse = false


#define doodadStep


#define doodadDraw
draw_self()
#define corpseSpawn

i = instance_create(x,y,obj_doodad)

with(i){
    
    corpse = true
    
    player=other.player
    if (player = true){
        global.pc = id
    }
    
    floorID = other.floorID
    z = other.z
    
    animUpdate = other.animUpdate
    animType = other.animType
    player = other.player
    alive = false
    
    vFacing = other.vFacing
    hFacing = other.hFacing
    facing = other.facing
        
    animIndex[0] = other.animIndex[0]  //Current animation (For Legs+Body)
    animStep[0] = other.animStep[0]     //Current animation step
    animDelay[0] = other.animDelay[0]    //How many seconds to next step
    animSpeed[0] = other.animSpeed[0]    //Multiplier for animation speed (can be negative)
    
    animIndex[1] = weaponIdle    //Right Hand
    animStep[1] = 0     
    animDelay[1] = 1    
    animSpeed[1] = 1    
    
    animIndex[2] = weaponIdle    //Left Hand
    animStep[2] = 0     
    animDelay[2] = 1    
    animSpeed[2] = 1    
    
    bodyTwist = other.bodyTwist
    greatWeapon = other.greatWeapon
    
    //Surface Details
    charSurfSize = other.charSurfSize
    charSurf = surface_create(charSurfSize,charSurfSize)
    
    //Gender
    gender = other.gender
    
    //Appearance Info
    clothingSprite = other.clothingSprite
    skirtSprite = other.skirtSprite
    hairSprite = other.hairSprite
    hairColour = other.hairColour
    skinTone = other.skinTone
    
    //Anim
    legLength = other.legLength
    bounce = other.bounce
    bounceTimer = other.bounce
    flow = other.flow        //0 basic, 1 bounce, 2 flow left, 3 flow right
    flowTimer = other.flowTimer
    hairRot = other.hairRot
    
    //Bone Information
    hipsImage = other.hipsImage
    hipsSprite = other.hipsSprite
    hipsRot = other.hipsRot
    hipsVFacing = other.hipsVFacing
    hipsHFacing = other.hipsHFacing
    
    bodyImage = other.bodyImage
    bodySprite = other.bodySprite
    bodyXAdjust = other.bodyXAdjust
    bodyYAdjust = other.bodyYAdjust
    bodyRot = other.bodyRot
    bodyVFacing = other.bodyVFacing
    bodyHFacing = other.bodyHFacing
    
    chstImage = other.chstImage
    chstSprite = other.chstSprite
    chstXAdjust = other.chstXAdjust
    chstYAdjust = other.chstYAdjust
    
    shldrXAdjust[1] = other.shldrXAdjust[1]
    shldrYAdjust[1] = other.shldrYAdjust[1]
    shldrXAdjust[2] = other.shldrXAdjust[2]
    shldrYAdjust[2] = other.shldrYAdjust[2]
    
    handDist[1] = other.handDist[1]
    handDistDest[1] = other.handDistDest[1]
    handDir[1] = other.handDir[1]
    handDirDest[1] = other.handDirDest[1]
    handHeight[1] = other.handHeight[1]
    handHeightdest[1] = other.handHeightDest[1]
    
    handDist[2] = other.handDist[2]
    handDistDest[2] = other.handDistDest[2]
    handDir[2] = other.handDir[2]
    handDirDest[2] = other.handDirDest[2]
    handHeight[2] = other.handHeight[2]
    handHeightdest[2] = other.handHeightDest[2]

    
    armSprite = other.armSprite
    armSpriteLength = other.armSpriteLength
    
    headImage = other.headImage
    headSprite = other.headSprite
    headXAdjust = other.headXAdjust
    headYAdjust = other.headYAdjust
    headRot = other.headRot
    
    xAdj = other.xAdj
    yAdj = other.yAdj
    
    hipsX = other.hipsX
    hipsY = other.hipsY
    
    bodyX = other.bodyX
    bodyY = other.bodyY
    
    chstX = other.chstX
    chstY = other.chstY
    
    headX = other.headX
    headY = other.headY
    
    shldrX[1] = other.shldrX[1]
    shldrY[1] = other.shldrY[1]
    
    shldrX[2] = other.shldrY[2]
    shldrY[2] = other.shldrX[2]
    
    handX[1] = other.handX[1]
    handY[1] = other.handY[1]
    handX[2] = other.handX[2]
    handY[2] = other.handY[2]
    
}
//Create some sort of pilfer interactable