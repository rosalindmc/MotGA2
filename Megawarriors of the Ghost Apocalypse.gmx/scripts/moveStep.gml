#define moveStep
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