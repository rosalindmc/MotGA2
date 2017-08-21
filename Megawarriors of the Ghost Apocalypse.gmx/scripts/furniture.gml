#define furniture

#define furnitureInitialize

#define furnitureStep


#define furnitureDraw

#define createFurniture
i = instance_create(argument2*metre, argument3*metre,argument0);
with(i){
    script_execute(argument1);
}

#define lamp
isoDepth(5)
sprite_index = spr_standingDecorativeLamp;
image_index = choose(0,1,2,3);
//image_speed = 30/global.frameRate;

#define justianAltar
isoDepth(5)
sprite_index = spr_justianAltar;
image_index = choose(0,1,2,3,4);
deity = 'justia'

ii = instance_create(x,y,obj_interactable)
ii.name = 'Shrine to Justia'
ii.owner = id
ii.useType = shrineUse
interactId = ii