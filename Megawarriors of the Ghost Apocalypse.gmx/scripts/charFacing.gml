//Facing
if canMove = true
{
    if canAttack = true
    {
        if(global.pc.autoTarget == noone){
            //show_message('debug');
            facing = rotate(facing,point_direction(x,y,targetX,targetY),(180*turnSpeed)/global.frameRate)
        }
        else{
            facing = rotate(facing,point_direction(x,y,global.pc.autoTarget.x,global.pc.autoTarget.y),(180*turnSpeed)/global.frameRate)
        }
    }
    else
    {
        facing = rotate(facing,point_direction(x,y,targetX,targetY),(60*turnSpeed)/global.frameRate)
    }
}

if rotate(facing,270,90) = 270
{
    facingV = 0
}
else
{
    facingV = 1
}

if rotate(facing,180,90) = 180
{
    facingH = -1
}
else
{
    facingH = 1
}
