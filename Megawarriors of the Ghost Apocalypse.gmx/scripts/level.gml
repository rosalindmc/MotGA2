#define level


#define levelInitialize
//levelInitialize
//we need to make a world to pass information into this script

    biomeType = global.currNode.biomeType
    element = global.currNode.element
    sizeX = global.currNode.sizeX
    sizeY = global.currNode.sizeY
    global.poiSpacing = floor(sizeX/10)
    
    waterTiles[0] = -4
    numWaterTiles = 0
    pathTiles[0] = -4
    numPathTiles = 0
    
    room_height = sizeY*metre
    room_width = sizeX*metre
    global.surfX1 = room_width
    global.surfY1 = room_height
    global.surfX2 = 0
    global.surfY2 = 0
    global.liveSurf = true
    global.liveSurfX1 = 0
    global.liveSurfY1 = 0
    global.liveSurfX2 = 0
    global.liveSurfY2 = 0
    
    
    challenge = global.currNode.challenge
    
    for (var i = 0; i< array_length_1d(global.currNode.critPoi);i++){
        critPoi[i] = global.currNode.critPoi[i]     //the type of the critical point of interest
    }
    
    poiDensity = global.currNode.poiDensity //number of points of interest on the map
    numEntrance = global.currNode.numEntrance
    
    for (var i = 0; i< array_length_1d(global.currNode.pois);i++){
        pois[i] = global.currNode.pois[i]     //the type of the critical point of interest
    }
    
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
        if (critLength[i].finalWeight > critLength[j].finalWeight){
            j = i
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
        podSpawn(false)
    }
    
    
    //create the crit PoI deco
for (i = 0; i< array_length_1d(global.currNode.pois);i++){
    with (pois[i]){
        if(array_length_1d(furnitureArr) > 3){
            for(i = 0; i < array_length_1d(furnitureArr) / 4; i++){
                var place = i*4;
                //createFurniture(objType, statHolderScript, gridX, gridY)
                    //CURRENTLY IN DOODAD
                createFurniture(furnitureArr[place],furnitureArr[place+1],
                                 gridX + furnitureArr[place+2], gridY + furnitureArr[place+3]);
            }
            
        }
        
        if(array_length_1d(mobsArr) > 3){
            for(i = 0; i < array_length_1d(mobsArr) / 4; i++){
                var place = i*4;
                //createFurniture(objType, statHolderScript, gridX, gridY)
                //CURRENTLY IN DOODAD
                createChar((gridX + mobsArr[place]) * metre, (gridY + mobsArr[place+1]) * metre,
                                 mobsArr[place+2], mobsArr[place+3]);
            }
            
        }
    }
}
    
//start the threat timer for the level
threatInitialize();

//Temp assign tile information
with(obj_tile)
{
    if weight <= 2
    {
    global.currLevel.pathTiles[global.currLevel.numPathTiles] = id
    global.currLevel.numPathTiles += 1
    }
}
    

with(obj_tile)
{
    if isRiver = true
    {
        sprite_index = spr_water
        depth = 5
        wz = -2
        z = -8
        
        if isPath = true
        {
            sprite_index = spr_bridge
            z = -4
        }
        
        //Check adjacency
        if gridY > 0
        {
            if other.floorLayout[gridX,gridY-1].isWater = false
            {
            wNBorder = true
            }
        }

        if gridY < other.sizeY-1
        {
            if other.floorLayout[gridX,gridY+1].isWater = false
            {
            wSBorder = true
            }
        }
        
        if gridX > 0
        {
            if other.floorLayout[gridX-1,gridY].isWater = false
            {
            wWBorder = true
            }
        }
        
        if gridX < other.sizeX-1
        {
            if other.floorLayout[gridX+1,gridY].isWater = false
            {
            wEBorder = true
            }
        }        
        
    }
    else if (isPath = true)
    {
        sprite_index = spr_road
        xScatter = choose(0,0,0,-1,1)
        yScatter = choose(0,0,0,-1,1)
        image_xscale = choose(-1,1)
        depth = -1
                
        if irandom(20) = 20
        {
            additDoodSpr[numAdditDood] = spr_bones;
            additDoodImg[numAdditDood] = irandom(4);
            additDoodX[numAdditDood] = irandom(4)-2;
            additDoodY[numAdditDood] = irandom(4)-2;
            
            numAdditDood++;
        }
    }
    else if isRiver = false
    {
        sprite_index = spr_tile   
        if weight >= 3
        {
            sprite_index = spr_grass
            xScatter = choose(0,0,0,-1,1)
            yScatter = choose(0,0,0,-1,1)
            image_xscale = choose(-1,1)
            depth = -2
            
            if irandom(2) = 0 and weight = 3
            {
                repeat(3+irandom(4))
                {
                    additDoodSpr[numAdditDood] = spr_blueGrass;
                    additDoodImg[numAdditDood] = irandom(4)
                    additDoodX[numAdditDood] = irandom(8)-4;
                    additDoodY[numAdditDood] = irandom(2)-4+numAdditDood;
                    additDoodFlip[numAdditDood] = choose(-1,1)
                    
                    numAdditDood++;
                }
            }
        }
        
        if weight = 4
        {
            i = instance_create(x-1+irandom(2),y-1+irandom(2),obj_terrain)
            i.sprite_index = spr_bush
            i.canReflect = false
        }
        else if weight > 4
        {
            
            i = instance_create(x-2+irandom(4),y-2+irandom(4),obj_terrain)
            for(ii = 0; ii < global.currLevel.numPathTiles; ii++)
            {
                if rectangle_in_rectangle(global.currLevel.pathTiles[ii].x-8,global.currLevel.pathTiles[ii].y-8,global.currLevel.pathTiles[ii].x+8,global.currLevel.pathTiles[ii].y,x-4,y,x+4,y-(metre*2.5)) != 0
                {
                    i.sprite_index = spr_bush
                    i.canReflect = false
                }
            }
        }        
    }
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
    
    var extra = choose(0,1,2,3);
    switch(extra){
        case 0:
        if (current.gridX - 1 != -1){
            floorLayout[current.gridX - 1, current.gridY].isPath = true;
            floorLayout[current.gridX - 1, current.gridY].rWeight = 5;
        }
        break;
        
        case 1:
        if (current.gridX + 1 != sizeX){
            floorLayout[current.gridX + 1, current.gridY].isPath = true;
            floorLayout[current.gridX + 1, current.gridY].rWeight = 5;
        }
        break;
        
        case 2:
        if (current.gridY - 1 != -1){
            floorLayout[current.gridX, current.gridY - 1].isPath = true;
            floorLayout[current.gridX, current.gridY - 1].rWeight = 5;
        }
        break;
        
        case 3:
        if (current.gridY + 1 != sizeY){
            floorLayout[current.gridX, current.gridY + 1].isPath = true;
            floorLayout[current.gridX, current.gridY + 1].rWeight = 5;
        }
        break;
    }

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

    waterTiles[numWaterTiles] = current.pathParent
    numWaterTiles += 1
    
    current.pathParent.isRiver = true
    current.pathParent.isWater = true
    global.surfX1 = min(global.surfX1,current.pathParent.x-8)
    global.surfY1 = min(global.surfY1,current.pathParent.y-8)
    global.surfX2 = max(global.surfX2,current.pathParent.x+8)
    global.surfY2 = max(global.surfY2,current.pathParent.y+8)
    
    if (current.gridX - 1 != -1){
        waterTiles[numWaterTiles] = floorLayout[current.gridX - 1, current.gridY]
        numWaterTiles += 1
        
        floorLayout[current.gridX - 1, current.gridY].isRiver = true
        floorLayout[current.gridX - 1, current.gridY].isWater = true
        global.surfX1 = min(global.surfX1,floorLayout[current.gridX - 1, current.gridY].x-8)
        global.surfY1 = min(global.surfY1,floorLayout[current.gridX - 1, current.gridY].y-8)
        global.surfX2 = max(global.surfX2,floorLayout[current.gridX - 1, current.gridY].x+8)
        global.surfY2 = max(global.surfY2,floorLayout[current.gridX - 1, current.gridY].y+8)
    }
    if (current.gridY - 1 != -1){
        waterTiles[numWaterTiles] = floorLayout[current.gridX, current.gridY - 1]
        numWaterTiles += 1
        
        floorLayout[current.gridX, current.gridY - 1].isRiver = true
        floorLayout[current.gridX, current.gridY - 1].isWater = true
        global.surfX1 = min(global.surfX1,floorLayout[current.gridX, current.gridY - 1].x-8)
        global.surfY1 = min(global.surfY1,floorLayout[current.gridX, current.gridY - 1].y-8)
        global.surfX2 = max(global.surfX2,floorLayout[current.gridX, current.gridY - 1].x+8)
        global.surfY2 = max(global.surfY2,floorLayout[current.gridX, current.gridY - 1].y+8)
    }
    
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

global.threatTimer = 0;

ds_list_destroy(global.threatList);
#define itemList
//Temp location
return choose(sword,edgeySword,choppySword,stabbyAxe,club,staff,stabbySword,bigStabbySword,bigSword,biggerSword,circleySword,axe,longAxe,throwyAxe,mace,warhammer,spear,pike,genericPotion)