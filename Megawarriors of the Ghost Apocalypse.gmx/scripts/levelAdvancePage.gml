#define levelAdvancePage


#define levelAdvanceInitialize
global.timeMult = 0

#define levelAdvanceStep

#define levelAdvanceDraw

#define levelAdvance
with obj_item{
    if instance_exists(owner){
        if !owner.player{
            instance_destroy()
        }
        else{
            //instance_deactivate_object(id)
        }
    }
    else{
        instance_destroy()
    }
}
with obj_char{
    if !player{
        instance_destroy()
    }
    //instance_deactivate_object(id)
}

with obj_tile
    instance_destroy()
with obj_terrain
    instance_destroy()
with obj_doodad
    instance_destroy()
with obj_flag
    instance_destroy()
with obj_pod
    instance_destroy()
with obj_level
    instance_destroy()
    
global.currNodeIndex++

if global.currNodeIndex = array_length_1d(global.mainWorld.nodeArray){
    with global.mainWorld{
        worldGen()
        global.currNodeIndex = 0
    }
}

global.currNode = global.mainWorld.nodeArray[global.currNodeIndex]

global.currLevel = instance_create(0,0,obj_level)

with (global.currLevel){
    levelInitialize()
}
    
