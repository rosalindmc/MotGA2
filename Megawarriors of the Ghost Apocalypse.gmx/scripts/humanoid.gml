#define humanoid
//Humanoid Control Script
switch(argument0)
{
case 0:     //Initialize Humanoid
humanoidInitialize()
break

case 1:     //Draw Humanoid
humanoidDraw()
break

case 2:
return humanoidWalk
break

case 3:
return humanoidIdle
break

case 4:
return humanoidShortDodge
break

case 5:
return humanoidDodge
break

case 6:
return humanoidDie
break
}

#define humanoidInitialize
//Establish Humanoid variables

//Surface Details
charSurfSize = 28
charSurf = surface_create(charSurfSize,charSurfSize)

//Gender
gender = 0

//Appearance Info
clothingSprite = spr_cBerzerk
skirtSprite = spr_sBarbarian
hairSprite = spr_longHair
hairColour = hairBlack
helmSprite = spr_none
skinTone = choose(skinTan,skinDark,skinBrown,skinPink,skinPale,skinFireRed,skinBurntRed,skinAshRed)

//Anim
legLength = 4
bounce = 0
bounceTimer = 0
flow = 0        //0 basic, 1 bounce, 2 flow left, 3 flow right
flowTimer = 0
hairRot = 0

//Bone Information
hipsImage = 0
hipsSprite = spr_humanoidLegs
hipsRot = 0
hipsVFacing = 0
hipsHFacing = 1
hipsAlpha = 1

bodyImage = 0
bodySprite = spr_humanoidBody
bodyXAdjust = 0
bodyYAdjust = 4
bodyRot = 0
bodyVFacing = 0
bodyHFacing = 1

chstImage = 0
chstSprite = spr_humanoidChest
chstXAdjust = 1
chstYAdjust = -1

shldrXAdjust[1] = 1
shldrYAdjust[1] = 1
shldrXAdjust[2] = 2
shldrYAdjust[2] = 1

handDist[1] = 4
handDistDest[1] = 4
handDir[1] = 0
handDirDest[1] = 0
handHeight[1] = 2
handHeightdest[1] = 2

itemRot[1] = 0
itemRotDest[1] = 0
itemZRot[1] = 0
itemZRotDest[1] = 0
itemSprite[1] = spr_sword
itemFlip[1] = 1
itemHoldAdjust[1] = 0

handDist[2] = 4
handDistDest[2] = 4
handDir[2] = 0
handDirDest[2] = 0
handHeight[2] = 2
handHeightDest[2] = 2

itemRot[2] = 0
itemRotDest[2] = 0
itemZRot[2] = 0
itemZRotDest[2] = 0
itemSprite[2] = spr_sword
itemFlip[2] = 1
itemHoldAdjust[2] = 0

armSprite = spr_humanoidArms
armSpriteLength = 5
armAlpha[1] = 1
armAlpha[2] = 1

headImage = 0
headSprite = spr_humanoidHead
headXAdjust = 0
headYAdjust = 4
headRot = 0
headAlpha = 1

xAdj = 0
yAdj = 0

hipsX = 0
hipsY = 0

bodyX = 0
bodyY = 0

chstX = 0
chstY = 0

headX = 0
headY = 0

shldrX[1] = 0
shldrY[1] = 0

shldrX[2] = 0
shldrY[2] = 0

handX[1] = 0
handY[1] = 0
handX[2] = 0
handY[2] = 0

//Body Variants
gender = choose(0,1)

switch(choose(0,1,2))
{
case 0:
//Small

break

case 1:
//Medium
bodyImage = 2
chstImage = 1
chstXAdjust = 1
chstYAdjust = -1
shldrXAdjust[1] = 2
shldrYAdjust[1] = 1
shldrXAdjust[2] = 3
shldrYAdjust[2] = 1
headXAdjust = 0
headYAdjust = 4
break

case 2: 
//Large
bodyImage = 4
chstImage = 2
chstXAdjust = 0
chstYAdjust = -1
shldrXAdjust[1] = 3
shldrYAdjust[1] = 2
shldrXAdjust[2] = 4
shldrYAdjust[2] = 2
headXAdjust = 0
headYAdjust = 4
break
}

//Temp Clothes Randomize
if gender = 0
{
    clothingSprite = spr_cDemonHunter
    skirtSprite = spr_sDemonHunter
}
else
{
    clothingSprite = spr_cDemonHunterM
    skirtSprite = spr_none
}

#define humanoidDraw
//Establish bone information
//Draw All Details to Char Surface

//Special Timers
if bounceTimer > 0
{
    bounceTimer -= 1/global.frameRate
    if bounceTimer <= 0
    {
        bounceTimer = 0
        bounce = 0
    }
}

if flowTimer > 0
{
    flowTimer -= 1/global.frameRate
    if flowTimer <= 0
    {
        flowTimer = 0
        flow = 0
    }
}

if surface_exists(charSurf)  
{        
    surface_set_target(charSurf)
    draw_clear_alpha(c_white,0)
        
    //Body Facing and Direction
    twist(bodyTwist)
    
    //Bone Locations
    hipsX = round(charSurfSize*.5)+lengthdir_x(legLength, hipsRot+90)+xAdj
    hipsY = round(charSurfSize*.75)+lengthdir_y(legLength, hipsRot+90)-yAdj
    
    bodyX = hipsX+lengthdir_x(bodyYAdjust, hipsRot+90)+lengthdir_x(bodyXAdjust*bodyHFacing, hipsRot)
    bodyY = hipsY+lengthdir_y(bodyYAdjust, hipsRot+90)+lengthdir_y(bodyXAdjust*bodyHFacing, hipsRot)
    
    chstX = bodyX+lengthdir_x(chstYAdjust+bounce, bodyRot+90)+lengthdir_x(chstXAdjust*bodyHFacing, bodyRot)
    chstY = bodyY+lengthdir_y(chstYAdjust+bounce, bodyRot+90)+lengthdir_y(chstXAdjust*bodyHFacing, bodyRot)
    
    headX = bodyX+lengthdir_x(headYAdjust, bodyRot+90)+lengthdir_x(headXAdjust*bodyHFacing, bodyRot)
    headY = bodyY+lengthdir_y(headYAdjust, bodyRot+90)+lengthdir_y(headXAdjust*bodyHFacing, bodyRot)
    
    shldrX[1] = bodyX+lengthdir_x(shldrYAdjust[1], bodyRot+90)+lengthdir_x(shldrXAdjust[1]*bodyHFacing, bodyRot)+min(bodyHFacing,0)
    shldrY[1] = bodyY+lengthdir_y(shldrYAdjust[1], bodyRot+90)+lengthdir_y(shldrXAdjust[1]*bodyHFacing, bodyRot)
    
    shldrX[2] = bodyX+lengthdir_x(shldrYAdjust[2], bodyRot+90)+lengthdir_x(shldrXAdjust[2]*bodyHFacing, bodyRot+180)+min(bodyHFacing,0)
    shldrY[2] = bodyY+lengthdir_y(shldrYAdjust[2], bodyRot+90)+lengthdir_y(shldrXAdjust[2]*bodyHFacing, bodyRot+180)
    
    handX[1] = round(bodyX+lengthdir_x(handDist[1], (round(facing/15)*15)+handDir[1]))
    handY[1] = round(bodyY+lengthdir_y(handDist[1], (round(facing/15)*15)+handDir[1]))-handHeight[1]
    
    handX[2] = round(bodyX+lengthdir_x(handDist[2], (round(facing/15)*15)+handDir[2]))
    handY[2] = round(bodyY+lengthdir_y(handDist[2], (round(facing/15)*15)+handDir[2]))-handHeight[2]    
    
    //Hand Shenanigans
    //If using a great weapon, move second hand
    if greatWeapon = true and handItem[1] != noone
    {
        handX[2] = round(handX[1]+lengthdir_x(handItem[1].gwPoint, handItem[1].image_angle))
        handY[2] = round(handY[1]+lengthdir_y(handItem[1].gwPoint, handItem[1].image_angle))
        
        handX[1] = round(handX[1]+lengthdir_x(handItem[1].gwPoint*-1, handItem[1].image_angle))
        handY[1] = round(handY[1]+lengthdir_y(handItem[1].gwPoint*-1, handItem[1].image_angle))
    }
    
    //Arm Directions
    handPoint[1] = point_direction(shldrX[1+shldrSwap],shldrY[1+shldrSwap],handX[1],handY[1])
    handPoint[2] = point_direction(shldrX[2-shldrSwap],shldrY[2-shldrSwap],handX[2],handY[2])
    armLength[1] = min(point_distance(handX[1],handY[1],shldrX[1+shldrSwap],shldrY[1+shldrSwap]),armSpriteLength-1)
    armStretch[1] = max(point_distance(handX[1],handY[1],shldrX[1+shldrSwap],shldrY[1+shldrSwap]),armSpriteLength)/(armSpriteLength)
    armLength[2] = min(point_distance(handX[2],handY[2],shldrX[2-shldrSwap],shldrY[2-shldrSwap]),armSpriteLength-1)
    armStretch[2] = max(point_distance(handX[2],handY[2],shldrX[2-shldrSwap],shldrY[2-shldrSwap]),armSpriteLength)/(armSpriteLength)
    
    if vFacing = 0
    {
        draw_sprite_ext(hairSprite,4+bounce,headX,headY,hFacing,1,hairRot,hairColour,1)    
    }
    
    if handDir[1] < 180
    {
    //Right Arm
    draw_sprite_ext(armSprite,armLength[1],shldrX[1+shldrSwap],shldrY[1+shldrSwap],armStretch[1],bodyHFacing,handPoint[1],skinTone,armAlpha[1])
    draw_sprite_ext(clothingSprite,10+armLength[1],shldrX[1+shldrSwap],shldrY[1+shldrSwap],armStretch[1],bodyHFacing,handPoint[1],c_white,armAlpha[1])
    }
    
    if handDir[2] < 180
    {
    //Left Arm
    draw_sprite_ext(armSprite,armLength[2]+armSpriteLength,shldrX[2-shldrSwap],shldrY[2-shldrSwap],armStretch[2],bodyHFacing,handPoint[2],skinTone,armAlpha[2])
    draw_sprite_ext(clothingSprite,10+armLength[2]+armSpriteLength,shldrX[2-shldrSwap],shldrY[2-shldrSwap],armStretch[2],bodyHFacing,handPoint[2],c_white,armAlpha[2])
    }
    
    //Hips and Legs
    draw_sprite_ext(skirtSprite,(flow*2)+1-hipsVFacing,hipsX,hipsY,hipsHFacing,1,hipsRot,c_gray,hipsAlpha)
    draw_sprite_ext(hipsSprite,hipsImage+hipsVFacing,hipsX,hipsY,hipsHFacing,1,hipsRot,skinTone,hipsAlpha)
    draw_sprite_ext(clothingSprite,20+hipsImage+hipsVFacing,hipsX,hipsY,hipsHFacing,1,hipsRot,c_white,hipsAlpha)
    draw_sprite_ext(skirtSprite,(flow*2)+hipsVFacing,hipsX,hipsY,hipsHFacing,1,hipsRot,c_white,hipsAlpha)
    
    //Body
    if bodyVFacing = 1 and gender = 0
    {
        draw_sprite_ext(chstSprite,chstImage,chstX,chstY,bodyHFacing,1,bodyRot,skinTone,1)
        draw_sprite_ext(clothingSprite,7+chstImage,chstX,chstY,bodyHFacing,1,bodyRot,c_white,1)
    }
    
    draw_sprite_ext(bodySprite,bodyImage+bodyVFacing,bodyX,bodyY,bodyHFacing,1,bodyRot,skinTone,1)
    draw_sprite_ext(clothingSprite,1+bodyImage+bodyVFacing,bodyX,bodyY,bodyHFacing,1,bodyRot,c_white,1)
    
    if bodyVFacing = 0 and gender = 0
    {
        draw_sprite_ext(chstSprite,chstImage,chstX,chstY,bodyHFacing,1,bodyRot,skinTone,1)
        draw_sprite_ext(clothingSprite,7+chstImage,chstX,chstY,bodyHFacing,1,bodyRot,c_white,1)
    }
        
    //Head
    draw_sprite_ext(headSprite,headImage+vFacing,headX,headY,hFacing,1,headRot,skinTone,headAlpha)
    draw_sprite_ext(helmSprite,headImage+vFacing,headX,headY,hFacing,1,headRot,c_white,headAlpha)
    draw_sprite_ext(hairSprite,(bounce*2)+vFacing,headX,headY,hFacing,1,headRot,hairColour,headAlpha)
    if vFacing = 1
    {
        draw_sprite_ext(hairSprite,4+bounce,headX,headY,hFacing,1,hairRot,hairColour,headAlpha)    
    }
    
    if handDir[1] >= 180
    {
        //Right Arm
        draw_sprite_ext(armSprite,armLength[1],shldrX[1+shldrSwap],shldrY[1+shldrSwap],armStretch[1],bodyHFacing,handPoint[1],skinTone,armAlpha[1])
        draw_sprite_ext(clothingSprite,10+armLength[1],shldrX[1+shldrSwap],shldrY[1+shldrSwap],armStretch[1],bodyHFacing,handPoint[1],c_white,armAlpha[1])
    }
    
    if handDir[2] >= 180
    {
        //Left Arm
        draw_sprite_ext(armSprite,armLength[2]+armSpriteLength,shldrX[2-shldrSwap],shldrY[2-shldrSwap],armStretch[2],bodyHFacing,handPoint[2],skinTone,armAlpha[2])
        draw_sprite_ext(clothingSprite,10+armLength[2]+armSpriteLength,shldrX[2-shldrSwap],shldrY[2-shldrSwap],armStretch[2],bodyHFacing,handPoint[2],c_white,armAlpha[2])
    }
            
    //draw_set_colour(c_red)
    //draw_line(shldrX[2-shldrSwap],shldrY[2-shldrSwap],shldrX[2-shldrSwap]+lengthdir_x(armStretch[2]*armSpriteLength,handPoint[2]),shldrY[2-shldrSwap]+lengthdir_y(armStretch[2]*armSpriteLength,handPoint[2]))
    //draw_set_colour(c_green)
    //draw_point(shldrX[2-shldrSwap],shldrY[2-shldrSwap])
    //draw_point(handX[2],handY[2])
    //draw_line(shldrX[2-shldrSwap],shldrY[2-shldrSwap],handX[2],handY[2])

    //draw_line(shldrX[1+shldrSwap],shldrY[1+shldrSwap],handX[1+shldrSwap],handY[1+shldrSwap])
    //draw_point(shldrX[1+shldrSwap],shldrY[1+shldrSwap])
    
    if instance_exists(floorID)
    {
        if floorID.wz != 0
        {
            draw_set_blend_mode(bm_subtract)
            draw_rectangle(0,round(charSurfSize*.75)+min(z,0)-floorID.wz+1,charSurfSize,round(charSurfSize*.75)+1,false)
            draw_set_blend_mode(bm_normal)
        }
    }
    surface_reset_target()
}
else
{
    charSurf = surface_create(charSurfSize,charSurfSize)
}

#define humanoidWalk
animSpeed[argument1] = max(abs(moving),1)
xAdj = 0
yAdj = 0

hipsRot = 0
bodyRot = 0
hairRot = 0
headRot = 0

if staggered = true or lastStand != false
{
    bodyRot = -30*hFacing
    headRot = -45*hFacing
}
else if fatigued != false
{
    bodyRot = -30*hFacing
}

switch(argument0)
{
    case 0:
    humanoidWalk(3,argument1)
    animStep[argument1] = 3
    break
    
    case 1:
    hipsImage = 6
    legLength = 4
    animDelay[argument1] = 2
    flow = 3
    if moving < 0
    {
        flow = 2
    }
    flowTimer = .2
    footStep(0)
    break
    
    case 2:
    hipsImage = 8
    legLength = 3
    bounce = 1
    bounceTimer = .2
    animDelay[argument1] = 1
    flow = 1
    flowTimer = .2
    footStep(0)
    break
    
    case 3:
    hipsImage = 4
    legLength = 4
    bounce = 1
    bounceTimer = .2
    animDelay[argument1] = 1
    flow = 3
    if moving < 0
    {
        flow = 2
    }
    flowTimer = .2
    break
    
    case 4:
    humanoidWalk(1,argument1)
    animStep[argument1] = 1
    break
}

#define humanoidIdle
animDelay[argument1] = .3
animSpeed[argument1] = 1
xAdj = 0
yAdj = 0

hipsRot = 0
bodyRot = 0
hairRot = 0
headRot = 0

if staggered = true or lastStand != false
{
    bodyRot = -30*hFacing
    headRot = -45*hFacing
}
else if fatigued != false
{
    bodyRot = -30*hFacing
}

if isProne = true or alive = false
{
    hipsImage = 2
    hipsRot = 90*hFacing
    bodyRot = 90*hFacing
    headRot = 90*hFacing
    hairRot = 90*hFacing
    xAdj = 5*hFacing
    yAdj = 2
}
else
{
    switch(argument0)
    {
        case 0:
        hipsImage = 2-(gender*2)
        legLength = 4
        break
        
        case 1:
        hipsImage = 8
        legLength = 3
        bounce = 1
        bounceTimer = .2
        flow = 2
        flowTimer = .2
        break
        
        case 2:
        hipsImage = 2-(gender*2)
        legLength = 4
        bounce = 1
        bounceTimer = .2
        flow = 1
        flowTimer = .2
        break
        
        case 3:
        humanoidIdle(0,argument1)
        animStep[argument1] = 0
        break
    }
}

#define humanoidSneakWalk
animSpeed[argument1] = max(abs(moving),1)
xAdj = 0
yAdj = 0

hipsRot = 0
bodyRot = 0
hairRot = 0
headRot = 0

if staggered = true or lastStand != false
{
    bodyRot = -30*hFacing
    headRot = -45*hFacing
}
else if fatigued != false
{
    bodyRot = -30*hFacing
}

switch(argument0)
{
    case 0:
    humanoidSneakWalk(3,argument1)
    animStep[argument1] = 3
    break
    
    case 1:
    hipsImage = 14
    legLength = 2
    animDelay[argument1] = 2
    flow = 3
    if moving < 0
    {
        flow = 2
    }
    flowTimer = .2
    footStep(0)
    break
    
    case 2:
    hipsImage = 16
    legLength = 3
    bounce = 1
    bounceTimer = .2
    animDelay[argument1] = 1
    flow = 1
    flowTimer = .2
    footStep(0)
    break
    
    case 3:
    hipsImage = 18
    legLength = 3
    bounce = 1
    bounceTimer = .2
    animDelay[argument1] = 1
    flow = 3
    if moving < 0
    {
        flow = 2
    }
    flowTimer = .2
    break
    
    case 4:
    humanoidSneakWalk(1,argument1)
    animStep[argument1] = 1
    break
}

#define humanoidSneakIdle
animDelay[argument1] = .3
animSpeed[argument1] = 1
xAdj = 0
yAdj = 0

hipsRot = 0
bodyRot = 0
hairRot = 0
headRot = 0

if staggered = true or lastStand != false
{
    bodyRot = -30*hFacing
    headRot = -45*hFacing
}
else if fatigued != false
{
    bodyRot = -30*hFacing
}

if isProne = true or alive = false
{
    hipsImage = 2
    hipsRot = 90*hFacing
    bodyRot = 90*hFacing
    headRot = 90*hFacing
    hairRot = 90*hFacing
    xAdj = 5*hFacing
    yAdj = 2
}
else
{ 
    switch(argument0)
    {
        case 0:
        hipsImage = 14
        legLength = 2
        break
        
        case 1:
        hipsImage = 14
        legLength = 2
        break
        
        case 2:
        hipsImage = 14
        legLength = 2
        break
        
        case 3:
        humanoidSneakIdle(0,argument1)
        animStep[argument1] = 0
        break
    }     
}

#define humanoidShortDodge
animSpeed[argument1] = max(abs(moving),1)

switch(argument0)
{
    case 0:
    z += 4
    zspd += 2
    if sign(hspd) = sign(hFacing)
    {
        hipsImage = 12
    }
    else
    {
        hipsImage = 14
    }
    hairRot = -45*sign(hspd)
    
    footStep(0)
    animDelay[argument1] = .1
    break
    
    case 1:
    hipsRot = -30*sign(hspd)
    bodyRot = -30*sign(hspd)
    hairRot = -90*sign(hspd)
    headRot = 0
    bounce = 1
    bounceTimer = .2
    
    animDelay[argument1] = .1
    break
    
    case 2:
    hipsImage = 8
    legLength = 3
    hipsRot = 0
    hairRot = -45*sign(hspd)
    animDelay[argument1] = .1
    
    //Hit Ground
    footStep(1)
    break
    
    case 3:
    animationReset(0)
    break
}

#define humanoidDodge
animSpeed[argument1] = max(abs(moving),1)

switch(argument0)
{
    case 0:
    z += 4
    zspd += 2
    hipsImage = 2
    hipsRot = -15*hFacing
    bodyRot = -30*hFacing
    hairRot = -45*hFacing
    animDelay[argument1] = .05
    
    bounce = 1
    bounceTimer = .2
    break
    
    case 1:
    hipsImage = 6
    hipsRot = -90+facing
    bodyRot = -90+facing
    hairRot = -90+facing
    headRot = -90+facing
    
    xAdj = lengthdir_x(-5,facing)
    yAdj = 6
    
    animDelay[argument1] = .25
    break
    
    case 2:
    hipsImage = 10
    hipsRot = -150*hFacing
    bodyRot = -240*hFacing
    hairRot = -240*hFacing
    headRot = -270*hFacing
    animDelay[argument1] = .04
    
    bounce = 1
    bounceTimer = .2
    
    xAdj = -3*hFacing
    yAdj = 10
    
    hspd = lengthdir_x(dodgeSpeed,facing)
    vspd = lengthdir_y(dodgeSpeed,facing)
    
    //Hit Ground
    footStep(2)
    
    break
    
    case 3:
    hipsImage = 10
    hipsRot = -180*hFacing
    bodyRot = -270*hFacing
    hairRot = -270*hFacing
    headRot = -300*hFacing
    
    xAdj = 0
    yAdj = 10
    
    animDelay[argument1] = .04
    break
    
    case 4:
    hipsImage = 10
    hipsRot = -210*hFacing
    bodyRot = -300*hFacing
    hairRot = -300*hFacing
    headRot = -330*hFacing
    
    xAdj = 3*hFacing
    yAdj = 9
    
    animDelay[argument1] = .04
    break
    
    case 5:
    hipsImage = 10
    hipsRot = -240*hFacing
    bodyRot = -330*hFacing
    hairRot = -330*hFacing
    headRot = 0
    
    xAdj = 7*hFacing
    yAdj = 6
    
    animDelay[argument1] = .04
    break
    
    case 6:
    hipsImage = 4
    hipsRot = -270*hFacing
    bodyRot = 0
    hairRot = -270*hFacing
    headRot = -30*hFacing
    
    xAdj = 8*hFacing
    yAdj = 3
    
    animDelay[argument1] = .04
    break
    
    case 7:
    hipsImage = 2
    hipsRot = 30*hFacing
    bodyRot = 0
    hairRot = -90*hFacing
    headRot = 0
    
    xAdj = 5*hFacing
    yAdj = 1
    
    bounce = 1
    bounceTimer = .2
    
    animDelay[argument1] = .1
    break
    
    case 8:
    animationReset(0)
    break
}

#define humanoidFlinchForward
animSpeed[argument1] = 1

switch(argument0)
{
    case 0:
    hipsImage = 12
    hipsRot = -30*hFacing
    bodyRot = -30*hFacing
    hairRot = -90*hFacing
    
    bounce = 1
    bounceTimer = .2
    flow = 2
    flowTimer = .1
    
    animDelay[argument1] = .1
    footStep(1)
    break

    case 1:
    hipsRot = -15*hFacing
    bodyRot = -15*hFacing
    hairRot = -45*hFacing

    animDelay[argument1] = .1
    break

    case 2:
    hipsImage = 4
    hipsRot = -15*hFacing
    bodyRot = -15*hFacing
    hairRot = -15*hFacing
    animDelay[argument1] = .1
    break

    case 3:
    hipsImage = 2
    hipsRot = -15*hFacing
    bodyRot = 0
    hairRot = 15*hFacing
    animDelay[argument1] = .1
    break

    case 4:
    animationReset(0)
    break
}


#define humanoidFlinchBackward
animSpeed[argument1] = 1

switch(argument0)
{
    case 0:
    hipsImage = 10
    hipsRot = 30*hFacing
    bodyRot = 30*hFacing
    hairRot = 90*hFacing
    
    bounce = 1
    bounceTimer = .2
    flow = 3
    flowTimer = .1
    
    animDelay[argument1] = .1
    footStep(1)
    break

    case 1:
    hipsRot = 15*hFacing
    bodyRot = 15*hFacing
    hairRot = 45*hFacing

    animDelay[argument1] = .1
    break

    case 2:
    hipsImage = 4
    hipsRot = 15*hFacing
    bodyRot = 15*hFacing
    hairRot = 15*hFacing
    animDelay[argument1] = .1
    break

    case 3:
    hipsImage = 2
    hipsRot = 15*hFacing
    bodyRot = 0
    hairRot = -15*hFacing
    animDelay[argument1] = .1
    break

    case 4:
    animationReset(0)
    break
}


#define humanoidDie
animSpeed[argument1] = 1
xAdj = 8*hFacing

switch(argument0)
{
    case 0:
    hipsImage = 10
    hipsRot = 30*hFacing
    bodyRot = 30*hFacing
    hairRot = 90*hFacing
    
    bounce = 1
    bounceTimer = .2
    flow = 3
    flowTimer = .1
    
    animDelay[argument1] = .1
    footStep(1)
    bleedOut()
    break

    case 1:
    hipsRot = 45*hFacing
    bodyRot = 60*hFacing
    headRot = 45*hFacing
    hairRot = 135*hFacing

    animDelay[argument1] = .1
    bleedOut()
    break

    case 2:
    hipsImage = 4
    hipsRot = 90*hFacing
    bodyRot = 90*hFacing
    headRot = 60*hFacing
    hairRot = 180*hFacing
    
    bounce = 1
    bounceTimer = .2
    flow = 3
    flowTimer = .1
    xAdj = 1*hFacing
    
    animDelay[argument1] = .1
    bleedOut()
    break

    case 3:
    hipsImage = 2
    hipsRot = 90*hFacing
    bodyRot = 90*hFacing
    headRot = 90*hFacing
    hairRot = 105*hFacing
    xAdj = 3*hFacing
    animDelay[argument1] = .1
    bleedOut()
    break

    case 4:
    hipsImage = 2
    hipsRot = 90*hFacing
    bodyRot = 90*hFacing
    headRot = 90*hFacing
    hairRot = 90*hFacing
    xAdj = 5*hFacing
    yAdj = 2
    animDelay[argument1] = .1
    bleedOut()
    break
    
    case 5:
    if ((!player) and alive = false) and abs(hspd) < 1 and abs(vspd) < 1 and z = floorZ
    {
        corpseSpawn()
        instance_destroy()
    }
    else
    {
        animationReset(0)
    }
    break
}


#define footStep
//Check floor and make relvent sound+particles

//Temp replace later
if (instance_exists(floorID)){
    if floorID.isRiver = false
    {
        createParticle(x,y,z,1,partDust,hFacing)
        if(!floorID.isPath)
            moveDT = 0.1;
        else
            moveDT = 0;
    }
    else
    {
        createParticle(x,y-1,floorID.wz+5,5+irandom(5)*argument0,partSplash,argument0)
        createParticle(x,y,floorID.wz,1,partRipple,argument0)
        if(!floorID.isPath)
            moveDT = 1;
        else
            moveDT = 0.5;
    }
}

if player = true
{
    obj_control.shake += argument0
}