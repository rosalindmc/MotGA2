#define moveStep
var temp = 0

floorID = obj_level.floorLayout[median(0,floor(x/metre),obj_level.sizeX-1),median(0,floor(y/metre),obj_level.sizeY-1)]
floorZ = floorID.z

//Gravity
if z+max(0,zspd) > floorZ
{
    zspd -= grav/global.frameRate
    z += zspd*metre/global.frameRate
}
else
{
    zspd = 0
    z = floorZ
}

//Horizontal Collision
if place_meeting(x+(metre*hspd/global.frameRate),y,obj_solid) or collision_line(x,y,x+(metre*hspd/global.frameRate),y,obj_solid,false,true)
{
    while !place_meeting(x+sign(hspd),y,obj_solid) and temp < 100
    {
        x += sign(hspd)
        temp++ 
    }
    hspd = 0
}

x += metre*hspd/global.frameRate

//Vertical Collision
if place_meeting(x,y+(metre*vspd/global.frameRate),obj_solid) or collision_line(x,y,x,y+(metre*vspd/global.frameRate),obj_solid,false,true)
{
    while !place_meeting(x,y+sign(vspd),obj_solid) and temp < 100 
    {
        y += sign(vspd)
        temp++
    }
    vspd = 0
}

y += metre*vspd/global.frameRate
    
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
    moving = false
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
    z = floorZ
}

//Horizontal Collision
if place_meeting(x+(metre*hspd/global.frameRate),y,obj_solid) or collision_line(x,y,x+(metre*hspd/global.frameRate),y,obj_solid,false,true)
{
    while !place_meeting(x+sign(hspd),y,obj_solid)
    {
        x += sign(hspd)
    }
    hspd = 0
}

x += metre*hspd/global.frameRate

//Vertical Collision
if place_meeting(x,y+(metre*vspd/global.frameRate),obj_solid) or collision_line(x,y,x,y+(metre*vspd/global.frameRate),obj_solid,false,true)
{
    while !place_meeting(x,y+sign(vspd),obj_solid)
    {
        y += sign(vspd)
    }
    vspd = 0
}

y += metre*vspd/global.frameRate

#define moveStepParticle
//Gravity
if z+max(0,zspd) > floorZ
{
    zspd -= grav/global.frameRate*gravMult
    z += zspd*metre/global.frameRate
}
else
{
    zspd = 0
    hspd = 0
    vspd = 0
    z = floorZ
    
    if impactDeath = true
    {
        instance_destroy()
    }
}

x += metre*hspd/global.frameRate
y += metre*vspd/global.frameRate