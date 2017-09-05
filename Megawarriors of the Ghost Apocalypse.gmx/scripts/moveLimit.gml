//Establish Friction
if canMove = true
{
    f = (movement*fric*moveMult/(1+moveDT+(sneak*sneakMovePen)))
}
else
{
    f = (movement*fric)
}

//Apply Friction
if hspd != 0 or vspd != 0
{
    hT = hspd
    vT = vspd
    dT = point_distance(0,0,hT,vT)
    hspd = lengthdir_x(max(0,dT-(f/global.frameRate)),point_direction(0,0,hT,vT))
    vspd = lengthdir_y(max(0,dT-(f/global.frameRate)),point_direction(0,0,hT,vT))
}

/*
//Apply Friction
if hspd > 0 
{
    hspd = max(hspd-(f/global.frameRate),0)
}
else
{
    hspd = min(hspd+(f/global.frameRate),0)
}

if vspd > 0
{
    vspd = max(vspd-(f/global.frameRate),0)
}
else
{
    vspd = min(vspd+(f/global.frameRate),0)
}
