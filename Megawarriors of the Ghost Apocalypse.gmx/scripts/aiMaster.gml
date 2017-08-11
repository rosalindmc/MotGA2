#define aiMaster
if (life>0){
    aiMasterSearch()
}
else{
    currentAction = actionIdle
}




#define aiMasterSearch
//needs timer variable

var i = -1
var ret = 0
do{
    i++
    switch(alertState){
    case 'green':
        ret = script_execute(aiMasterListGreen[i], 0)  
        break 
    case 'yellow':
        ret = script_execute(aiMasterListYellow[i], 0)   
        break 
    case 'red':
        ret = script_execute(aiMasterListRed[i], 0)   
        break 
    }
}until (ret !=0)



switch(alertState){
case 'green':
    script_execute(aiMasterListGreen[i], 1)   
    break 
case 'yellow':
    script_execute(aiMasterListYellow[i], 1)   
    break 
case 'red':
    script_execute(aiMasterListRed[i], 1)   
    break 
}




/*
runs for every npc every x frames based on some AI thought speed variable AND 
        whenever they finish an order

        if no leader
            choose an action without waiting for an order
        if leader is present
            if no enemy
                enter idle state and wait for new order
            if enemy
                enter fight state
        if leader is alive but not present
            if no enemy
                path to leader
            if enemy
                enter fight state




#define tempAiFullPlan
/*
three levels
    master - behavior list
    
    runs for every npc every x frames based on some AI thought speed variable AND 
        whenever they finish an order
        
        chooses an action

        if no leader
            if no nearby leader
                choose an action without waiting for an order
            else
                choose a new leader, choose an action without waiting for an order
        if leader is present
            if no enemy
                enter idle state and wait for new order
            if enemy
                enter fight state
        if leader is alive but not present
            if no enemy
                path to leader
            if enemy
                enter fight state
        
        
    action - state machine
    
    runs after master, is just the current action the character is currently doing
    
    needs to be passed the following variables
        orderName
        targetX
        targetY
        targetId
    
        expected states:
            move
                just move to the target area
            interact
                move to the target area and interact with targetId
            attack
                move to target area and assault nearest enemy
            attackTarget
                move to target area and attack targetId
            patrol
                patrol between target area and here
            chase
                follow targetId
            chaseAlert
                follow targetId and make noise
            cover
                enter cover near target area
            hide
                move away from current area
            
        
        
    attack pattern - state machine
        
        Runs in combat and just sets up the attack animation. 
        Every enemy has their own list of attack animations they want to use
        
        
        
        
        
        
        
************************************************************************************
Detection
    
    AI has an alertness state basedon what has happened that they are aware of on the map
        
    three alertness state
        green
            nothing has happened, the ai isn't trying to detect the player
            may use Master less frequently
            
        yellow
            the ai is within line of sight or hearing range of a character or have noticed a problem
            they gain an awareness variable that increments up until they enter red alert            
        
        
        red
            the ai already has a target, and persues them until they escape or are killed
            once an AI enters red they can never return to green
    
    two types of detection
        Sound
            Things with in sound intensity radius enter yellow
            Many ways of reducing sound
            ais have some listen stat that effects how likely they are to hear you
            
            Deafness
                Set the value of the ai's deafness value to the loudest recent noise they've heard        
        
        Sight
            any time the ai can raycast to you in their front arc they enter yellow
            awareness is gained according to how close you are to them
            
            two vision cones
                yellow
                    if you have even half cover (crouched, waist high walls, other obstructions like smoke)
                        awareness does not tick up from sight
                red
                    if you don't have full cover(crouching behind waist high walls, full walls)
                        awareness ticks very quickly
                        
                
******************************************************************************************

Stealth stat
    divides the rate of awareness gain
    
    there are two values for the stealth stat that default to the stealth stat
    stealth
        effects sight   
        is increased by obscurements such as shadow and smoke 
    
    sound multiplier
        effects sound
        is changed by surface or weapon
        

    stealth stats by class
        Warrior/berserk     0.75
        Default             1.00
        Illusionist/wraith  1.50
        scoundrel/ghost     2.00
        burgler             2.50

        
***************************************************************************************
Sound making stuff
    none/very low - stealth footsteps
    low - footsteps, breathing, missed swings, pilfering, lock picking
    medium - hits, bows, rolling, most spells, opening doors, opening chests, shooting(suppressed)
    high - weapon clashing, striking walls/armour/constructs, energy guns, forcing doors
    very high - explosions, shooting, bashing doors
    
        
        
    