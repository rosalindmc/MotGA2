#define moveStep
var temp = 0

gridX = median(0,floor(x/metre),global.currLevel.sizeX-1)
gridY = median(0,floor(y/metre),global.currLevel.sizeY-1)
floorID = global.currLevel.floorLayout[gridX,gridY]
floorZ = floorID.z
collide = false

//Gravity
if z+max(0,zspd) > floorZ
{
    zspd -= grav/global.frameRate
    z += zspd*metre/global.frameRate
}
else
{
    if z != floorZ
    {
        footStep(0)
    }
    zspd = 0
    z = floorZ
}

//Horizontal Collision
if (place_meeting(x+(metre*hspd/global.frameRate),y,obj_solid) or collision_line(x,y,x+(metre*hspd/global.frameRate),y,obj_solid,false,true))
{
    while collision_line(x,y,x+sign(hspd),y,obj_solid,false,true) && hspd != 0{
        x -= sign(hspd)
        }
        
    if dangerous = true
    {
        collide = true
        hspd *= .2
    }   
    else
    {
        hspd = 0
    }
}

if collide = false
{
    x += metre*hspd/global.frameRate
}

//Vertical Collision
if (place_meeting(x,y+(metre*vspd/global.frameRate),obj_solid) or collision_line(x,y,x,y+(metre*vspd/global.frameRate),obj_solid,false,true))
{
    while collision_line(x,y,x,y+sign(vspd),obj_solid,false,true) && vspd != 0{
        y -= sign(vspd)
        } 
    
    if dangerous = true
    {
        collide = true
        vspd *= .2
    } 
    else
    {
        vspd = 0
    }
}

if collide = false
{
    y += metre*vspd/global.frameRate
}

//Check Moving
if canMove = true and point_distance(x,y,xprevious,yprevious) > 0
{
    if abs(angle_difference(point_direction(x,y,targetX,targetY),point_direction(xprevious,yprevious,x,y))) < 90
    {
        moving = point_distance(x,y,xprevious,yprevious)*global.frameRate/metre
    }
    else
    {
        moving = -point_distance(x,y,xprevious,yprevious)*global.frameRate/metre
    }
}
else
{
    moving = 0
}

if collide = true
{
    dangerous = false
    collide = false
    
    cPow = point_distance(0,0,hspd,vspd)
    
    i = instance_create(x+lengthdir_x(metre*.5,point_direction(0,0,hspd,vspd)),y+lengthdir_y(metre*.5,point_direction(0,0,hspd,vspd)),obj_meleeCollider)
    i.owner = launcher
    i.originX = x
    i.originY = y
    i.dist = 0
    i.image_angle = point_direction(0,0,hspd,vspd)
    i.dmgType = dmgType.impact
    i.dmg = cPow*.1
    i.impact = cPow*.5    
    i.pen = 100
    i.z = 0
    i.image_alpha = 0
    //i.visNumbers = false
    i.sprite_index = spr_slam
    i.sticky = false
    i.image_xscale = .8
    i.image_yscale = .8   
    i.impactType = 1
    
    launcher = noone
}

//Bound to map
x = median(0,x,room_width)
y = median(0,y,room_height)


#define moveStepObject
//Gravity
if z+max(0,zspd) > floorZ
{
    zspd -= grav/global.frameRate
    z += zspd*metre/global.frameRate
}
else
{
    zspd = 0
    hspd = 0
    vspd = 0
    spin = 0
    dangerous = false
    z = floorZ
}

collide = false

//Horizontal Collision
if place_meeting(x+(metre*hspd/global.frameRate),y,obj_solid) or collision_line(x,y,x+(metre*hspd/global.frameRate),y,obj_solid,false,true)
{
    while !place_meeting(x+sign(hspd),y,obj_solid) && hspd != 0
    {
        x += sign(hspd)
    }
    
    if dangerous = true
    {
        collide = true
        hspd *= 1
    }   
    else
    {
        hspd = 0
    }
}

x += metre*hspd/global.frameRate

//Vertical Collision
if place_meeting(x,y+(metre*vspd/global.frameRate),obj_solid) or collision_line(x,y,x,y+(metre*vspd/global.frameRate),obj_solid,false,true)
{
    while !place_meeting(x,y+sign(vspd),obj_solid) && vspd != 0
    {
        y += sign(vspd)
    }
    
    if dangerous = true
    {
        collide = true
        vspd *= 1
    }   
    else
    {
        vspd = 0
    }
}


if collide = true
{
    dangerous = false
    collide = false
       
    i = instance_create(x,y,obj_meleeCollider)
    i.owner = thrower
    i.originX = x
    i.originY = y
    i.dist = 0
    i.image_angle = dir
    i.dmgType = throwType
    i.dmg = throwPow*thrower.damageMod*(1+(thrower.perfectTimeDmgMod*sweetSpot))
    i.impact = throwImpact*thrower.impactMod
    i.pen = throwPen+thrower.penMod
    i.sweetSpot = sweetSpot
    i.z = z
    i.sprite_index = spr_stab
    i.image_alpha = 0
}

y += metre*vspd/global.frameRate

#define moveStepParticle
//Gravity
gridX = median(0,floor(x/metre),global.currLevel.sizeX-1)
gridY = median(0,floor(y/metre),global.currLevel.sizeY-1)
floorID = global.currLevel.floorLayout[gridX,gridY]
floorZ = floorID.wz

if gravMult != 0
{
    if z+max(0,zspd) > floorZ
    {
        zspd -= grav/global.frameRate*gravMult
        z += zspd*metre/global.frameRate
    }
    else
    {
        if bounciness > 0
        {
            zspd *= -bounciness
            z = floorZ
        }
        else
        {
            zspd = 0
            hspd = 0
            vspd = 0
            z = floorZ
        }
        
        if impactDeath = true
        {
            instance_destroy()
        }
    }
}

x += metre*hspd/global.frameRate
y += metre*vspd/global.frameRate