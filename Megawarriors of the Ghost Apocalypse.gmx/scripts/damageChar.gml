t = argument0

//Damage
if (type > 4){
    t.life -= (dmg)/(max(other.armour-(pen),1))*owner.physicalResist*damageResist[type]
}
else{
     t.life -= (dmg)/(max(other.armour-(pen),1))*owner.magicResist*damageResist[type]
}

createParticle(t.x,t.y,z,floor(dmg),partBlood,point_direction(originX,originY,t.x,t.y))

//Impact
t.hspd += lengthdir_x(impact,image_angle)//point_direction(originX,originY,t.x,t.y))
t.vspd += lengthdir_y(impact,image_angle)//point_direction(originX,originY,t.x,t.y))
t.stability -= impact

//Stagger
t.canMove = false
t.moveTimer += .5

with(t)
{
    if abs(angle_difference(other.image_angle,facing)) < 90
    {
        animationStart(humanoidFlinchForward,0)
    }
    else
    {
        animationStart(humanoidFlinchBackward,0)
    }
}

//Shake
if owner.player = true or t.player = true
{
    obj_control.shake += impact
}
