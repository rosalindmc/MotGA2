#define mechanics


#define wepSlow1
switch(argument0)
{
case 0:     //Apply Effect
var ret = statusStack(effect);
icon = ico_stun
draw = false

owner.moveMult -= potency
owner.physicalResist -= .2
return ret;
break
case 1:     //Primary Tick Effect
break

case 2:     //Secondary Tick Effect
break

case 3:     //Destroy Effect
owner.moveMult += potency
owner.physicalResist += .2
break
case 4:     //Draw Event
break
}

#define wepSlow2
switch(argument0)
{
case 0:     //Apply Effect
var ret = statusStack(effect);
icon = ico_stun
draw = false

owner.moveMult -= potency
owner.physicalResist -= .2
return ret;
break
case 1:     //Primary Tick Effect
break

case 2:     //Secondary Tick Effect
break

case 3:     //Destroy Effect
owner.moveMult += potency
owner.physicalResist += .2
break
case 4:     //Draw Event
break
}
#define lastStandBleedout
switch(argument0)
{
case 0:     //Apply Effect
var ret = statusStack(effect);
tickLength1 = 1
owner.moveMult -= .25
owner.stamRegen -= 2
owner.stability = owner.stabilityMax
owner.physicalResist -= 2
draw = false
return ret;
break
case 1:     //Primary Tick Effect
owner.life += 1
if owner.life = owner.lifeMax
{
    owner.lastStand = false
    owner.life = ceil(owner.lifeMax/4)
    life = 0
}
break
case 2:     //Secondary Tick Effect
break
case 3:     //Destroy Effect
owner.moveMult += .25
owner.stamRegen += 2
owner.physicalResist += 2
break
case 4:     //Draw Event
break
}

#define fatigue
switch(argument0)
{
case 0:     //Apply Effect
var ret = statusStack(effect);
tickLength1 = .1
owner.moveMult -= .2
owner.stamRegen -= 3
owner.physicalResist -= .2
owner.fatigued += 1
draw = false
return ret;
break
case 1:     //Primary Tick Effect
if owner.stam = owner.stamMax
{
    life = 0
}
break
case 2:     //Secondary Tick Effect
break
case 3:     //Destroy Effect
owner.moveMult += .2
owner.stamRegen += 3
owner.physicalResist += .2
owner.fatigued -= 1
break
case 4:     //Draw Event
break
}
