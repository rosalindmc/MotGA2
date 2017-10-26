#define threatControl
//the step for this runs in the controlStep script.  Could easily be moved here.

#define threatInitialize
//set this up to later be able to scale to the overworld threat on level init
if (global.owThreat < 5){
    global.threatList = ds_list_create();
    ds_list_add(global.threatList, owThreatUp, newPodOne, increaseTimer, alert);
}

global.threatTimer = 0;

global.threatSpeed = 1/30;
//higher overworld threats will have their own starting lists that are more difficult

#define threatUp
//what happens when the local threat increments

switch(global.locThreat){
    default://case 0:
    threatCount = 0;
    //figure out a more universal equation and maybe put some of this in its own script
    threshold = 1+threatCount*0.5;
    ds_list_add(global.threatList, newPodOne);
    break;


}

while(threatCount < threshold){ 
        var rand = irandom(ds_list_size(global.threatList) - 1);
        threatCount += script_execute(ds_list_find_value(global.threatList,rand));
    }


if(global.locThreat % 3 == 1){
    global.owThreat++;
    //show_message(global.owThreat);
}

if global.locThreat < 8
{
    global.locThreat++;
}

#define threatDown
//Using a threat reducing ability runs this script
//There might be other things that it runs, depending on which ability was used

global.locThreat--;

#define owThreatUp
//Increase the threat level in the overworld

//show_message('NeRPs forces are spreading - OverWorld Threat++');
global.owThreat++;

return 1;

#define newPodOne
if instance_number(obj_char) < 25   //Temp limiter
{
with(obj_poi){
    if(entrance){
        if (random(10)<10/global.currLevel.numEntrance){
            i = instance_create(x,y,obj_pod);
            with(i){
                gridX = other.gridX;
                gridY = other.gridY;
                podTypeSelect();
                podSpawn(true);
                
                instance_destroy();
            }
        }
    }
}
}
return 1;

#define increaseTimer
//speed up the time until the next threat

//show_message('NeRP knows about you.  Hurry up');

/*

if(global.threatSpeed > 5)
    global.threatSpeed--

return 1;

#define alert
with(obj_char){
    if(!player && irandom(2)>1){
        //actionTargetId = global.pc;
    }
}

return 1;
