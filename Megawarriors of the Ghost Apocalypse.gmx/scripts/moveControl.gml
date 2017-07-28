var moveT = (movement*moveMult)

moveT = moveT/(1+moveDT)

/*
if sprinting = true and (leftKey-rightKey != 0 or upKey-downKey != 0)
{
    spDelay = .5
    moveT *= 1.5
    sp -= 1.5/global.frameRate
}
*/

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
