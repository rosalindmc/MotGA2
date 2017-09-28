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

if ((!player) and alive = false) and abs(hspd) < 1 and abs(vspd) < 1 and z = floorZ and animIndex[0] != humanoid(6)
{
    corpseSpawn()
    instance_destroy()
}
