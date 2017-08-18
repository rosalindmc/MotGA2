#define physical

#define stun

#define bleed
switch(argument0)
{
case 0:     //Apply Effect
tickLength1 = 3
tickLength2 = 1
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
}
