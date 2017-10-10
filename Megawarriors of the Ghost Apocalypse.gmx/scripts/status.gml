#define status


#define applyStatus
//Apply a status effect to a character(target,type,potency,duration,origin,stacking)
if argument5 = true or !statusStack(argument0,argument1,argument3)
{
i = instance_create(argument0.x,argument0.y,obj_status)
    
    with(i)
    {
        owner = argument0
        effect = argument1
        potency = argument2
        life = argument3
        creator = argument4
        
        script_execute(effect,0)
        tickTimer1 = tickLength1
        tickTimer2 = tickLength2
        if draw = true
        {
            createParticle(x,y,3*metre,1,partIcon,icon)
        }        
        ds_list_add(owner.sEffect,id)
    }
}

#define statusInitialize
host = -4
life = 1
potency = 1
effect = -4
icon = spr_none
draw = true

tickTimer1 = 0
tickLength1 = 0
tickTimer2 = 0
tickLength2 = 0

#define statusStep
if instance_exists(owner)
{
    tickTimer1 -= 1/global.frameRate
    
    if tickTimer1 <= 0
    {
        script_execute(effect,1)
        tickTimer1 += tickLength1
    }
    
    tickTimer2 -= 1/global.frameRate
    
    if tickTimer2 <= 0
    {
        script_execute(effect,2)
        tickTimer2 += tickLength1
    }
    
    life -= 1/global.frameRate
    
    if life <= 0
    {
        instance_destroy()
    }
}
else
{
    instance_destroy()
}

#define statusDrawEnd
script_execute(effect,4)

#define statusDestroy
if instance_exists(owner)
{
    ds_list_delete(owner.sEffect,ds_list_find_index(owner.sEffect,id))
    script_execute(effect,3)
}
#define statusStack
//(target,type,duration)
var found = false

if(ds_list_size(argument0.sEffect) != 0)
{
    for(var i = 0; i < ds_list_size(argument0.sEffect); i++)
    {
        if ds_list_find_value(argument0.sEffect,i).effect = argument1
        {
            found = true
            with(ds_list_find_value(argument0.sEffect, i))
            {
                life = argument2;
            }
        }
    }
}
return found;
