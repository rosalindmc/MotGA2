#define gibArm
//argument0 how gibbed
//argument1 which 
ix = x+(shldrX[argument1]-(charSurfSize*.5))
iy = y
iz = ((charSurfSize*.75)-shldrY[argument1])
dir = random(360)

switch(argument0)
{
    case dmgType.rend:
    armAlpha[argument1] = 0
    createParticle(ix,iy,iz,5,partBlood,dir)
    createParticle(ix,iy,iz,1,partGib,dir)
    i.sprite_index = armSprite
    i.image_index = armLength[argument1]
    i.spr2 = clothingSprite
    i.img2 = 10+armLength[argument1]
    i.col1 = skinTone
    i.zspd = -3+random(7)
    break
    case dmgType.impact:
    armAlpha[argument1] = 0
    createParticle(ix,iy,iz,2,partBone,dir)
    createParticle(ix,iy,iz,5,partBlood,dir)
    break
}

#define gibHead
//argument0 how gibbed
ix = x+(headX-(charSurfSize*.5))
iy = y
iz = ((charSurfSize*.75)-headY)
dir = random(360)

switch(argument0)
{
    case dmgType.rend:
    headAlpha = 0
    createParticle(ix,iy,iz,10,partBlood,dir)
    createParticle(ix,iy,iz,1,partGib,dir)
    i.sprite_index = headSprite
    i.image_index = headImage+vFacing
    i.col1 = skinTone
    if helmSprite = spr_none
    {
        i.spr2 = hairSprite
        i.img2 = vFacing
        i.col2 = skinTone
    }
    else
    {
        i.spr2 = helmSprite
        i.img2 = headImage+vFacing
    }
    break
    case dmgType.impact:
    headAlpha = 0
    createParticle(ix,iy,iz,4,partBone,dir)
    createParticle(ix,iy,iz,10,partBlood,dir)
    break
}

#define gibLegs
//argument0 how gibbed
ix = x+(hipsX-(charSurfSize*.5))
iy = y
iz = ((charSurfSize*.75)-hipsY)
dir = random(360)

switch(argument0)
{
    case dmgType.rend:
    hipsAlpha = 0
    createParticle(ix,iy,iz,20,partBlood,dir)
    createParticle(ix,iy,iz,1,partGib,dir)
    i.sprite_index = hipsSprite
    i.image_index = hipsImage+hipsVFacing
    i.spr2 = clothingSprite
    i.img2 = 20+hipsImage+hipsVFacing
    i.col1 = skinTone
    i.zspd = -2+random(2)
    break
    case dmgType.impact:
    createParticle(ix,iy,iz,6,partBone,dir)
    createParticle(ix,iy,iz,20,partBlood,dir)
    hipsAlpha = 0
    break
}