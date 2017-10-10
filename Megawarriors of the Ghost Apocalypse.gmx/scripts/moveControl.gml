#define moveControl
var moveT = moveTCalc()

if canMove = true
{
    //Horizontal Movement
    if leftKey-rightKey = 1
    {
        hspd = max(-moveT,hspd-(moveT*(accel+fric)/global.frameRate))
    }
    else if leftKey-rightKey = -1
    {
        hspd = min(moveT,hspd+(moveT*(accel+fric)/global.frameRate))
    }
    
    //Vertical Movement
    if upKey-downKey = 1
    {
        vspd = max(-moveT,vspd-(moveT*(accel+fric)/global.frameRate))
    }
    else if upKey-downKey = -1
    {
        vspd = min(moveT,vspd+(moveT*(accel+fric)/global.frameRate))
    }
    
    hT = hspd
    vT = vspd
    dT = point_distance(0,0,hT,vT)
    hspd = lengthdir_x(min(moveT,dT),point_direction(0,0,hT,vT))
    vspd = lengthdir_y(min(moveT,dT),point_direction(0,0,hT,vT))
}

#define moveTCalc
if z = floorZ
{
return (movement*median(.25,moveMult,2))/(1+moveDT+(sneak*sneakMovePen))
}
else
{
return 0
}