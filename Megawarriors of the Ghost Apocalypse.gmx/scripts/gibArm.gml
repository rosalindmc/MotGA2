#define gibArm
//argument0 how gibbed
//argument1 which 
ix = x+(shldrX[argument1]-(charSurfSize*.5))
iy = y
iz = ((charSurfSize*.75)-shldrY[argument1])

switch(argument0)
{
    case dmgType.rend:
    armAlpha[argument1] = 0
    createParticle(ix,iy,iz,1,partGib,random(360))
    createParticle(ix,iy,iz,5,partBlood,random(360))
    i.sprite_index = armSprite
    i.image_index = armLength[argument1]
    i.spr2 = clothingSprite
    i.img2 = 10+armLength[argument1]
    i.col1 = skinTone
    break
    case dmgType.impact:
    armAlpha[argument1] = 0
    createParticle(ix,iy,iz,5,partBlood,random(360))
    break
}

#define gibHead
//argument0 how gibbed
ix = x+(headX-(charSurfSize*.5))
iy = y
iz = ((charSurfSize*.75)-headY)

switch(argument0)
{
    case dmgType.rend:
    headAlpha = 0
    createParticle(ix,iy,iz,10,partBlood,random(360))
    createParticle(ix,iy,iz,1,partGib,random(360))
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
    createParticle(ix,iy,iz,10,partBlood,random(360))
    break
}

#define gibLegs
//argument0 how gibbed
ix = x+(hipsX-(charSurfSize*.5))
iy = y
iz = ((charSurfSize*.75)-hipsY)

switch(argument0)
{
    case dmgType.rend:
    hipsAlpha = 0
    createParticle(ix,iy,iz,1,partGib,random(360))
    createParticle(ix,iy,iz,20,partBlood,random(360))
    i.sprite_index = hipsSprite
    i.image_index = hipsImage+hipsVFacing
    i.spr2 = clothingSprite
    i.img2 = 20+hipsImage+hipsVFacing
    i.col1 = skinTone
    break
    case dmgType.impact:
    createParticle(ix,iy,iz,20,partBlood,random(360))
    hipsAlpha = 0
    break
}
