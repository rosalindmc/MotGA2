#define physical

#define stun
switch(argument0)
{
case 0:     //Apply Effect
var ret = statusStack(effect);
icon = ico_stun


owner.moveMult = 0.25
owner.canAttack = false
owner.canDodge = false
owner.staggered = true

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

owner.moveMult = 1.0
owner.canAttack = true
owner.canDodge = true
owner.staggered = false
break
case 4:     //Draw Event
draw_sprite_ext(spr_stunSpiral,0,owner.x-(owner.charSurfSize*.5)+owner.headX,owner.y-(owner.charSurfSize*.5)+owner.headY-metre,1,1,global.timer*90,c_white,1)
break
}

#define bleed
switch(argument0)
{
case 0:     //Apply Effect
tickLength1 = 3
tickLength2 = 1
icon = ico_bleed
return false;//Because this effect can stack
break
case 1:     //Primary Tick Effect
owner.life -= floor(potency+random(.99))
createParticle(owner.x,owner.y,(owner.charSurfSize*.75)-owner.bodyY,8,partBlood,random(360))
break
case 2:     //Secondary Tick Effect
createParticle(owner.x,owner.y,(owner.charSurfSize*.75)-owner.bodyY,2,partBlood,random(360))
break
case 3:     //Destroy Effect
break
case 4:     //Draw Event
break
}
