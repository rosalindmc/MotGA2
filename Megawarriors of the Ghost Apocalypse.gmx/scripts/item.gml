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
}

#define itemInitialize
itemSurf = surface_create(40,40)
hand = 0            //0 = inInventory, 1/2 equal corresponding hand, 3 is held in both hands
owner = noone       //Who currently owns/wields this item

type = sword
hand1Pos = 0
hand2Pos = 0

hspd = 0
vspd = 0
zspd = 0
floorZ = 0
z = 0
spin = 0

interactId = noone

#define itemStep
if owner != noone
{
    //Resolve Owned
    if instance_exists(owner)
    {
        if hand != 0
        {
            image_angle = (round(owner.facing/15)*15)+owner.itemRot[hand]+owner.bodyRot
            x = owner.handX[hand]+round(owner.x)-(owner.charSurfSize*.5)+lengthdir_x(holdPoint,image_angle)
            z = (owner.charSurfSize*.75)-round(owner.bodyY+owner.handHeight[hand]+owner.z)
            y = owner.handY[hand]+round(owner.y)-(owner.charSurfSize*.75)+lengthdir_y(holdPoint,image_angle)+z
            image_index = 0
            isoDepth(0)
        }
    }
}
else
{
    //Resolve Unowned
    image_angle += spin/global.frameRate
    moveStepObject()
    isoDepth(10)
}

#define itemDraw
if owner = noone or hand != 0
{
    if surface_exists(itemSurf)  
    {        
        surface_set_target(itemSurf)
        draw_clear_alpha(c_white,0)
            
        draw_sprite_ext(sprite_index,image_index,30,30,1,1,image_angle,c_black,.3)
        draw_sprite_ext(sprite_index,image_index,30,30,1,1,image_angle,c_white,1)  
        surface_reset_target()
    }
    else
    {
        itemSurf = surface_create(60,60)
    }
    draw_surface_ext(itemSurf,round(x-30),round(y-30-z),1,1,0,c_white,1)
    
    if global.surfX2 != 0
    {
        //Draw Block
        if surface_exists(global.blockSurf)
        {
            surface_set_target(global.blockSurf)
            draw_surface(itemSurf,round(x)-30-global.surfX1,round(y-z)-30-global.surfY1)      
            surface_reset_target()
        }
        
        //Draw Reflection
        if surface_exists(global.reflectSurf)
        {
            surface_set_target(global.reflectSurf)
            draw_surface_ext(itemSurf,round(x)-30-global.surfX1,round(y+z)-30-global.surfY1,1,1,0,c_white,1)
            surface_reset_target()
        }
    }
}
