#define physical


#define stun
switch(argument0)
{
case 0:     //Apply Effect
icon = ico_stun

owner.canAttack -= 1
owner.canDodge -= 1
if potency = 1 
{
    owner.staggered = true
}
else
{
    owner.isProne = true
}
owner.canMove -= 1
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

owner.canAttack += 1
owner.canDodge += 1
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
tickLength1 = 1
tickLength2 = .25
owner.moveMult -= .25
owner.stamRegen -= 1
icon = ico_bleed
break
case 1:     //Primary Tick Effect
damageChar(owner,1,dmgType.blood,false,creator)
createParticle(owner.x,owner.y,(owner.charSurfSize*.75)-owner.bodyY,8,partBlood,random(360))
break
case 2:     //Secondary Tick Effect
createParticle(owner.x,owner.y,(owner.charSurfSize*.75)-owner.bodyY,2,partBlood,random(360))
break
case 3:     //Destroy Effect
owner.moveMult += .25
owner.stamRegen += 1
break
case 4:     //Draw Event
break
}

#define vulnerable
switch(argument0)
{
case 0:     //Apply Effect
owner.physicalResist -= potency
icon = ico_vulnerable
break
case 1:     //Primary Tick Effect
break
case 2:     //Secondary Tick Effect
break
case 3:     //Destroy Effect
owner.physicalResist += potency
break
case 4:     //Draw Event
break
}