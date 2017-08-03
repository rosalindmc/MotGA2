#define level


#define levelInitialize
//levelInitialize
//we need to make a world to pass information into this script

    biomeType = global.currNode.biomeType
    element = global.currNode.element
    sizeX = global.currNode.sizeX
    sizeY = global.currNode.sizeY
    
    room_height = sizeY*metre
    room_width = sizeX*metre
    global.surfX1 = room_width
    global.surfY1 = room_height
    global.surfX2 = 0
    global.surfY2 = 0
    
    challenge = global.currNode.challenge
    
    critPoi[] = global.currNode.critPoi     //the type of the critical point of interest
    poiDensity = global.currNode.poiDensity //number of points of interest on the map
    numEntrance = global.currNode.numEntrance
    pois[]=global.currNode.pois[]
    numRivers=global.currNode.numRivers
    
    
    for (var i = 0; i< numRivers;i++){
        for(var j = 0; j < 4; j++){
            rivers[i,j] = 0
        }
    }
    
    
    critPods = global.currNode.critPods    //number of pods on the critical path
    podDensity = global.currNode.podDensity  //number of pods on the map
    podPower = global.currNode.podPower
    numPods = global.currNode.numPods
    
    podList[0] = noone
    
    itemDensity = global.currNode.itemDensity //number of item spawns on the map
    
    specialAreas = global.currNode.specialAreas    //number of special areas to spawn
    
    for (var i = 0; i < sizeX;i++){
        for(var j = 0; j < sizeY; j++){
            floorLayout[i,j] = instance_create(i,j,obj_tile)    //the map of floors and walls
        }
    }
    
    
    genLevel()
    for(i = 0; i < array_length_1d(pois)-1; i++){
        roadMaker(floorLayout[pois[i].gridX,pois[i].gridY],floorLayout[pois[i+1].gridX,pois[i+1].gridY])
    }
    
    for(i=0;i<numRivers;i++){
        riverMaker(floorLayout[rivers[i,0],rivers[i,1]],floorLayout[rivers[i,2],rivers[i,3]])
    }
    
    k = 0
    critLength[k] = instance_create(0,0,obj_flag)
    critLength[k].start = pois[array_length_1d(pois)-1]
    
    for(i = 0; i < array_length_1d(pois)-1; i++){
        for(j = 0; j < array_length_1d(pois)-1; j++){
            if(pois[i].entrance = true){
                if (pois[j].critical = true){
                    critLength[k] = critPather(floorLayout[pois[i].gridX,pois[i].gridY],floorLayout[pois[j].gridX,pois[j].gridY])
                    k++
                }
            }
        }
    }
    
    var j = 0
    
    for(i = 0; i < array_length_1d(critLength)-1; i++){
        if (critLength[i].finalWeight>critLength[i+1].finalWeight){
            j = i
        }
        else{
            j = i+1
        }
    }
    
    global.pc.x = critLength[j].start.gridX*16+8
    global.pc.y = critLength[j].start.gridY*16+8
    critLength[j].start.critPath = false
    
    for(i = 0; i < array_length_1d(critLength)-1; i++){
        with (critLength[i]){
            instance_destroy()
            }
    }
    
    podGen()
    
    with(obj_pod){
        podTypeSelect()
        podSpawn()
    }
    
//start the threat timer for the level
threatInitialize();

//replace later
repeat(10)
{
    createItem(random(100),random(100),sword,noone)
}


#define roadMaker
wipeTiles()
        
var start

start = argument0
finish = argument1
        
open = ds_priority_create()
ds_priority_add(open,start,0)

closed = ds_list_create()
current = start;
//start pathing

while(current != finish){
    current = ds_priority_delete_min(open);
    ds_list_add(closed, current);
    
    //show_debug_message(current.x)
    //show_debug_message(current.y)
    
    //step through all neighbours
    if (current.gridX - 1 != -1){
        algoCheckNeighbours(floorLayout[current.gridX-1, current.gridY],0);
    }
    if (current.gridX + 1 != sizeX){
        algoCheckNeighbours(floorLayout[current.gridX+1, current.gridY],0);
    }
    if (current.gridY - 1 != -1){
        algoCheckNeighbours(floorLayout[current.gridX, current.gridY-1],0);
    }
    if (current.gridY + 1 != sizeY){
        algoCheckNeighbours(floorLayout[current.gridX, current.gridY+1],0);
    }
}

ds_priority_destroy(open)
ds_list_destroy(closed)
        
current = finish
while(current.pathParent != noone)
{   
    
    current.pathParent.weight = 1
    current.pathParent.rWeight = 5

    if(current.gridX-1 >= 0){
        if (floorLayout[current.gridX-1, current.gridY].weight > 2){
            floorLayout[current.gridX-1, current.gridY].weight = 2
        }
    }
    
    if(current.gridX+1 < sizeX){
        if (floorLayout[current.gridX+1, current.gridY].weight > 2){
            floorLayout[current.gridX+1, current.gridY].weight = 2
        }
    }
    
    if(current.gridY-1 >= 0){   
        if (floorLayout[current.gridX, current.gridY-1].weight > 2){
            floorLayout[current.gridX, current.gridY-1].weight = 2
        }
    }
        
    if(current.gridY+1 < sizeY){
        if (floorLayout[current.gridX, current.gridY+1].weight > 2){
            floorLayout[current.gridX, current.gridY+1].weight = 2
        }
    }

    current.pathParent.isPath = true
    current = current.pathParent

}



#define riverMaker
wipeTiles()
        
var start

start = argument0
finish = argument1
        
open = ds_priority_create()
ds_priority_add(open,start,0)

closed = ds_list_create()
current = start;
//start pathing

while(current != finish){
    current = ds_priority_delete_min(open);
    ds_list_add(closed, current);
    
    //step through all neighbours
    if (current.gridX - 1 != -1){
        algoCheckNeighbours(floorLayout[current.gridX-1, current.gridY],1);
    }
    if (current.gridX + 1 != sizeX){
        algoCheckNeighbours(floorLayout[current.gridX+1, current.gridY],1);
    }
    if (current.gridY - 1 != -1){
        algoCheckNeighbours(floorLayout[current.gridX, current.gridY-1],1);
    }
    if (current.gridY + 1 != sizeY){
        algoCheckNeighbours(floorLayout[current.gridX, current.gridY+1],1);
    }
}

ds_priority_destroy(open)
ds_list_destroy(closed)
        
current = finish
while(current.pathParent != noone)
{
    current.pathParent.rWeight = 0.5

    current.pathParent.isRiver = true
    global.surfX1 = min(global.surfX1,current.pathParent.x-8)
    global.surfY1 = min(global.surfY1,current.pathParent.y-8)
    global.surfX2 = max(global.surfX2,current.pathParent.x+8)
    global.surfY2 = max(global.surfY2,current.pathParent.y+8)
    current = current.pathParent
}




#define critPather
wipeTiles()
        
var start
var finalWeight = 0

start = argument0
finish = argument1
        
open = ds_priority_create()
ds_priority_add(open,start,0)

closed = ds_list_create()
current = start;
//start pathing

while(current != finish){
    current = ds_priority_delete_min(open);
    ds_list_add(closed, current);
    
    //show_debug_message(current.x)
    //show_debug_message(current.y)
    
    //step through all neighbours
    if (current.gridX - 1 != -1){
        algoCheckNeighbours(floorLayout[current.gridX-1, current.gridY],0);
    }
    if (current.gridX + 1 != sizeX){
        algoCheckNeighbours(floorLayout[current.gridX+1, current.gridY],0);
    }
    if (current.gridY - 1 != -1){
        algoCheckNeighbours(floorLayout[current.gridX, current.gridY-1],0);
    }
    if (current.gridY + 1 != sizeY){
        algoCheckNeighbours(floorLayout[current.gridX, current.gridY+1],0);
    }
}

ds_priority_destroy(open)
ds_list_destroy(closed)


returnFlag = instance_create(0,0,obj_flag)
returnFlag.start = argument0
returnFlag.finalWeight = 0

current = finish
while(current.pathParent != noone)
{
    current.critPath = true
    returnFlag.finalWeight += current.weight
    current.pathParent.critPath = true
    current = current.pathParent
}

return returnFlag



#define wipeTiles
with (obj_tile){
    g = 0
    pathParent=noone
}


#define algoCheckNeighbours
//TAKES AN ARGUMENT FOR ADJACENT TILE AND ROAD (0) OR RIVER (1)

switch (argument1){
case 0:
var adjacent = argument0;
var tempG = current.g + adjacent.weight;

if ds_list_find_index(closed, adjacent) < 0
    {
    //attempt to reach an unreached tile
    if(ds_priority_find_priority(open,adjacent) == 0 || ds_priority_find_priority(open,adjacent) == undefined){
        adjacent.pathParent = current;
        adjacent.g = tempG;
        ds_priority_add(open, adjacent, adjacent.g+point_distance(adjacent.gridX,adjacent.gridY,finish.gridX,finish.gridY)+random(.5));
    }
}
/*
else{
//attempt to reach an already calculated tile faster
    if(tempG < adjacent.g){
        adjacent.pathParent = current;
        adjacent.g = tempG;
        ds_priority_change_priority(open, adjacent, adjacent.g+point_distance(adjacent.gridX,adjacent.gridY,finish.gridX,finish.gridY));
    }
}*/
break;
case 1:
var adjacent = argument0;
var tempG = current.g + adjacent.rWeight;

if ds_list_find_index(closed, adjacent) < 0
    {
    //attempt to reach an unreached tile
    if(ds_priority_find_priority(open,adjacent) == 0 || ds_priority_find_priority(open,adjacent) == undefined){
        adjacent.pathParent = current;
        adjacent.g = tempG;
        ds_priority_add(open, adjacent, adjacent.g+point_distance(adjacent.gridX,adjacent.gridY,finish.gridX,finish.gridY)+random(.5));
    }
}
/*
else{
//attempt to reach an already calculated tile faster
    if(tempG < adjacent.g){
        adjacent.pathParent = current;
        adjacent.g = tempG;
        ds_priority_change_priority(open, adjacent, adjacent.g+point_distance(adjacent.gridX,adjacent.gridY,finish.gridX,finish.gridY));
    }
}*/
break;
};
#define levelEnd
//clear up that little global list

global.threatTimer = false;

ds_list_destroy(global.threatList);