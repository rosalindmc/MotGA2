#define threatControl
//the step for this runs in the controlStep script.  Could easily be moved here.

#define threatInitialize
//set this up to later be able to scale to the overworld threat on level init
if (global.owThreat < 5){
    global.threatList = ds_list_create();
    ds_list_add(global.threatList, owThreatUp, newPodOne, increaseTimer);
}

global.threatTimer = true;
//higher overworld threats will have their own starting lists that are more difficult

#define threatUp
//what happens when the local threat increments

switch(global.locThreat){
    case 0:
    threatCount = 0;
    //figure out a more universal equation and maybe put some of this in its own script
    threshold = 1;
    ds_list_add(global.threatList, newPodOne);
    break;


}

while(threatCount < threshold){ 
        var rand = irandom(ds_list_size(global.threatList) - 1);
        threatCount += script_execute(ds_list_find_value(global.threatList,rand));
    }


if(global.locThreat % 3 == 1){
    global.owThreat++;
    show_message(global.owThreat);
}

global.locThreat++;

#define threatDown
//Using a threat reducing ability runs this script
//There might be other things that it runs, depending on which ability was used

global.locThreat--;

#define owThreatUp
//Increase the threat level in the overworld

show_message('NeRPs forces are spreading - OverWorld Threat++');
global.owThreat++;

return 1;

#define newPodOne
//create a new pod, level one

show_message('Spawned a new pod nearby');

return 1;

#define increaseTimer
//speed up the time until the next threat

show_message('NeRP knows about you.  Hurry up');
global.threatSpeed--

return 1;