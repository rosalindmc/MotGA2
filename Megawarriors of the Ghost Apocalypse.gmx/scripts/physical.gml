#define physical


#define stun
switch(argument0)
{
case 0:     //Apply Effect
var ret = statusStack(effect);
icon = ico_stun

owner.canAttack = false
owner.canDodge = false
if potency = 1 
{
owner.staggered = true
}
else
{
owner.isProne = true
}
owner.canMove = false
owner.physicalResist -= .5
owner.moveTimer = life

with(owner)
{
    animationReset(1)
    animationReset(2)    
}

i = instance_create(x,y,obj_interactable)
i.name = 'Grapple'
i.owner = owner
i.useType = grappleStart
interactId = i

return ret;
break
case 1:     //Primary Tick Effect
break

case 2:     //Secondary Tick Effect
break

case 3:     //Destroy Effect
with(interactId)
{
    instance_destroy()
}

owner.canAttack = true
owner.canDodge = true
owner.staggered = false
owner.isProne = false
owner.physicalResist += .5
break
case 4:     //Draw Event
if instance_exists(owner)
{
    draw_sprite_ext(spr_stunSpiral,0,owner.x-(owner.charSurfSize*.5)+owner.headX,owner.y-(owner.charSurfSize*.5)+owner.headY-metre,1,1,global.timer*90,c_white,1)
}
else
{
    instance_destroy()
}
break
}

#define bleed
switch(argument0)
{
case 0:     //Apply Effect
tickLength1 = 3
tickLength2 = 1
owner.moveMult -= .2
owner.stamRegen -= 1
icon = ico_bleed
return false;//Because this effect can stack
break
case 1:     //Primary Tick Effect
damageChar(owner,1,dmgType.blood,false,creator)
createParticle(owner.x,owner.y,(owner.charSurfSize*.75)-owner.bodyY,8,partBlood,random(360))
break
case 2:     //Secondary Tick Effect
createParticle(owner.x,owner.y,(owner.charSurfSize*.75)-owner.bodyY,2,partBlood,random(360))
break
case 3:     //Destroy Effect
owner.moveMult += .2
owner.stamRegen += 1
break
case 4:     //Draw Event
break
}