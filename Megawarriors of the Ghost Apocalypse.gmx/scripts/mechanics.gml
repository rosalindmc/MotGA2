#define mechanics


#define wepSlow1
switch(argument0)
{
case 0:     //Apply Effect
var ret = statusStack(effect);
icon = ico_stun
draw = false

owner.moveMult -= potency
owner.physicalResist -= .75
return ret;
break
case 1:     //Primary Tick Effect
break

case 2:     //Secondary Tick Effect
break

case 3:     //Destroy Effect
owner.moveMult += potency
owner.physicalResist += .75
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
owner.physicalResist -= .75
return ret;
break
case 1:     //Primary Tick Effect
break

case 2:     //Secondary Tick Effect
break

case 3:     //Destroy Effect
owner.moveMult += potency
owner.physicalResist += .75
break
case 4:     //Draw Event
break
}
