#define doodad


#define doodadInitialize
isoDepth(5)
image_index = irandom(2)
image_speed = 0
image_xscale = choose(-1,1)


#define doodadStep


#define doodadDraw
draw_self()
#define lamp
isoDepth(5)
sprite_index = spr_standingDecorativeLamp;
image_index = choose(0,1,2,3);
//image_speed = 30/global.frameRate;


#define createFurniture
i = instance_create(argument2*metre, argument3*metre,argument0);
with(i){
    script_execute(argument1);
}