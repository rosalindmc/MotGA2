#define item


#define createItem
//item creation requires special steps so instead of using create object
//you must use createItem(x,y,type,owner)

var i, ii;

i = instance_create(argument0,argument1,obj_item)
i.type = argument2
i.owner = argument3

with(i)
{
    script_execute(argument2,0)
}

if argument3 = noone
{
    ii = instance_create(i.x,i.y,obj_interactable)
    ii.name = i.name
    ii.owner = i
    ii.useType = pickUp
    i.interactId = ii
    
    if(argument2 = crate){//crate is currently in swords script
    ii.useType = openUp;//in pickUp
    }
}
else{
    ii = instance_create(i.x,i.y,obj_interactable)
    ii.name = i.name
    ii.owner = i
    with(ii){
        pickUp(argument3)
    }
}

#define itemInitialize
itemSurf = surface_create(60,60)
hand = 0            //0 = inInventory, 1/2 equal corresponding hand, 3 is held in both hands
owner = noone       //Who currently owns/wields this item

type = sword
hand1Pos = 0
hand2Pos = 0
force1h = false
force2h = false

hspd = 0
vspd = 0
zspd = 0
floorZ = 0
wz = 0
z = 0
zM = 1
zAngle = 0
spin = 0

dir = 0
interactId = noone
dangerous = false
thrower = noone
sweetSpot = false
collide = false

stuckDist = metre
stuckDir = 0
stuckIn = noone

weaponEssentials(0)

#define itemStep
if owner != noone
{
    //Resolve Owned
    if instance_exists(owner)
    {
        if hand != 0
        {
            image_angle = (round(owner.facing/15)*15)+owner.itemRot[hand]
            if abs(angle_difference(90,image_angle)) < 90
            {
                zAngle = ((owner.itemZRot[hand]))*(angle_difference(90,image_angle)/90)
                zM = 1-((1-abs(lengthdir_x(1,zAngle)))*(1-(abs(angle_difference(90,image_angle)/90))))
            }
            else
            {
                zAngle = ((owner.itemZRot[hand]))*(angle_difference(270,image_angle)/-90)
                zM = 1-((1-abs(lengthdir_x(1,zAngle)))*(1-(abs(angle_difference(270,image_angle)/90))))
            }
            image_xscale = owner.itemFlip[hand]
            image_yscale = owner.meleeSwing[hand]
            x = owner.x+lengthdir_x(owner.handDist[hand], (round(owner.facing/15)*15)+owner.handDir[hand])+lengthdir_x(holdPoint+owner.itemHoldAdjust[hand],image_angle+zAngle)
            z = (owner.charSurfSize*.75)-round(owner.bodyY-owner.handHeight[hand])+owner.z
            y = owner.y+lengthdir_y(owner.handDist[hand], (round(owner.facing/15)*15)+owner.handDir[hand])+lengthdir_y(holdPoint+owner.itemHoldAdjust[hand],image_angle+zAngle)
            image_index = 0
            isoDepth(0)
        }
    }
}
else if stuckIn != noone
{
    if instance_exists(stuckIn)
    {
        image_angle = round((stuckIn.facing/15)*15)+stuckDir
        x = stuckIn.x+lengthdir_x(stuckDist,image_angle+180)
        y = stuckIn.y+lengthdir_y(stuckDist,image_angle+180)
        image_index = 0
        isoDepth(0)
    }
}
else
{
    //Resolve Unowned
    if(type == crate)
    {
        image_index = imgInd;
    }
    
    if z+max(0,zspd) > floorZ
    {
        if spin != 0
        {
            zAngle -= spin/global.frameRate
        }
        else
        {
            image_angle = point_direction(0,0,hspd,vspd)
            zAngle = point_direction(0,0,abs(hspd),-zspd/2)
        }
    }
    moveStepObject()
    isoDepth(10)
}

#define itemDraw
if owner = noone or hand != 0
{
    if z >= wz or hand != 0
    {
        if surface_exists(itemSurf)  
        {        
            surface_set_target(itemSurf)
            draw_clear_alpha(c_white,0)
                
            draw_sprite_ext(sprite_index,image_index,30,30,(.5+(zM*.5))*image_xscale,(.75+(zM*.25))*image_yscale,image_angle+zAngle,c_white,1)  
            surface_reset_target()
        }
        else
        {
            itemSurf = surface_create(60,60)
        }
        draw_sprite_ext(sprite_index,image_index,x,y,abs(lengthdir_x(1,zAngle))*(.5+(zM*.5))*image_xscale,(.75+(zM*.25))*image_yscale,image_angle,c_black,.3)
        
        if stuckIn = noone
        {
            draw_surface_ext(itemSurf,round(x-30),round(y-30-z),1,1,0,c_white,1)     
        }
    }
}

#define itemDrawReflection
if global.liveSurf = true
{
    if surface_exists(itemSurf)  
    {
        //Draw Reflection
        if surface_exists(global.reflectSurf)
        {
            surface_set_target(global.reflectSurf)
            draw_surface_ext(itemSurf,round(x)-30-global.liveSurfX1,round(y+z)-30-global.liveSurfY1,1,1,0,c_white,1)
            surface_reset_target()
        }
    }
} 

#define itemDestroy
surface_free(itemSurf)
#define stickTarget
//script for sticking a target, argument 0 is the person being stuck
//if the owner = noone than noone is carrying the item sticking you and it jsut gets stuck in your body

i = instance_create(x,y,obj_text)
i.t = 'Stuck!'

stuckIn = argument0
stuckDir = image_angle-argument0.facing
stuckDist = min(length/2,point_distance(x,y,argument0.x,argument0.y))
ds_list_add(argument0.stuckWithItem,id)

//If this item is held, force the holder to face their target.  When a char (as opposed to an item is sticking someone)
if owner != noone
{
    stickChar(argument0,owner)       
}

#define stickChar
//Entering a stuck state with another character object, run by the stuck item

//arg0 is stuck by arg1
with(argument1)
{
    sticking = other.hand
    facing = point_direction(x,y,argument0.x,argument0.y)
    interactProgress = 0
    sweetSpot = false
    fumble = false
    
    if other.hand != 3
    {
        animationReset(other.hand)
    }
    else
    {
        animationReset(1)
        animationReset(2)
    }
}

ds_list_add(argument0.stuck,id)
argument0.animSpeed[0] = 0
argument0.facing = point_direction(argument0.x,argument0.y,x,y)
argument0.interactProgress = 0
argument0.canMove = false
argument0.moveTimer = 0
argument0.sweetSpot = false
argument0.fumble = false

with(argument0)
{
    animationReset(1)
    animationReset(2)    
}

stuckDist = min(length/2,point_distance(x,y,argument0.x,argument0.y))

#define unstickSelf
//Run by char, Clear the stuck list and free up the stickers
for(i = 0; i < ds_list_size(stuck); i++)
{
    ii = ds_list_find_value(stuck,i)
    ii.stuckIn = noone
    if (instance_exists(ii.owner)){
        ii.owner.sticking = 0
    }
    ds_list_delete(stuckWithItem,ds_list_find_index(stuckWithItem,ii))
}
    
ds_list_clear(stuck)
moveTimer += .1
animSpeed[0] = 1

#define unstickOther
//Run by char, Stop sticking someone else

if sticking = 3
{
    //show_message (ds_list_size(handItem[1].stuckIn.stuck))
    
    ds_list_delete(handItem[1].stuckIn.stuck,ds_list_find_index(handItem[1].stuckIn.stuck,id))
    ds_list_delete(handItem[1].stuckIn.stuckWithItem,ds_list_find_index(handItem[1].stuckIn.stuckWithItem,id))
    
    //show_message (ds_list_size(handItem[1].stuckIn.stuck))
    
    if ds_list_size(handItem[1].stuckIn.stuck) = 0
    {
        ds_list_clear(handItem[sticking].stuckIn.stuck)
        handItem[1].stuckIn.moveTimer += .1
        handItem[1].stuckIn.animSpeed[0] = 1
    }
    handItem[1].stuckIn = noone
    sticking = 0
    animationReset(1)
}
else
{
    //show_message (ds_list_size(handItem[sticking].stuckIn.stuck))
    
    ds_list_delete(handItem[sticking].stuckIn.stuck,ds_list_find_index(handItem[sticking].stuckIn.stuck,id))
    ds_list_delete(handItem[sticking].stuckIn.stuckWithItem,ds_list_find_index(handItem[sticking].stuckIn.stuckWithItem,id))
    
    //show_message (ds_list_size(handItem[sticking].stuckIn.stuck))
    
    if ds_list_size(handItem[sticking].stuckIn.stuck) = 0
    {
        ds_list_clear(handItem[sticking].stuckIn.stuck)
        handItem[sticking].stuckIn.moveTimer += .1
        handItem[sticking].stuckIn.animSpeed[0] = 1
    }
    handItem[sticking].stuckIn = noone
    
    if sticking = 1
    {
        sticking = 0
        animationReset(1)
    }
    else
    {
        sticking = 0
        animationReset(2)        
    }
}


#define abandonStick
//ran by char, abandon your current stuck item
//Fix

if sticking = 3
{
    ds_list_delete(handItem[1].stuckIn.stuck,ds_list_find_index(handItem[1].stuckIn.stuck,id))
    
    if ds_list_size(handItem[1].stuckIn.stuck) = 0
    {
        handItem[1].stuckIn.moveTimer += .1
        handItem[1].stuckIn.animSpeed[0] = 1
    }
    dropItem(1)
    animationReset(1)
}
else
{
    ds_list_delete(handItem[sticking].stuckIn.stuck,ds_list_find_index(handItem[sticking].stuckIn.stuck,id))
    
    if ds_list_size(handItem[sticking].stuckIn.stuck) = 0
    {
        handItem[sticking].stuckIn.moveTimer += .1
        handItem[sticking].stuckIn.animSpeed[0] = 1
    }
    dropItem(sticking)
    animationReset(sticking)
}

sticking = 0