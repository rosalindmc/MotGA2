#define levelGenMaster
/*
1) Create map to size
    Variables
        MapSizeX (Possibly random)
        MapSizeY
        MapContent [MapSizeX][MapSizeY]
        
    Give each tile a value according to variance and non-1 scaling
        
2) Generate PoI
    Variables
        PoILoc[] (multiple of 3 index array for location)
            Exit
            Miniboss    (Major)
            SpecItem    (Major?)
            Shrine
            Ally        (Major)
            Character   (Major)
            Site
            DungeonEnt  (Major)
            Door
            Key
            
            
    Points have an area where they set the value in MapContent to a value 
        that won't be used to generate other stuff as well as an entrance 
        point at a random point along the outside of the area. If a point's 
        area intersects with another's, reset the MapContent and move the 
        points away from eachother.

Connect points of interest with paths and generate paths
    Variables
        List or Array of points  
        
    Generate some extra points and add them to the PoI list as 
    Shuffle the list  

    Put all PoI entrances on a list, then shuffle the list.
    Using a* and the terrain costs, connect each PoI entrance
        with the next one on a list. Set all the tiles used as 1s
        (or 1s in the case of bridges)
          
        
    
4)Generate PoI from marked spaces
    
    Check type of area.
    Build according to area rules
    Look at the road entering entrance and find its' bearing in regards to important
        spaces. If there is no important space, add faded road tile.
    Add encounters if needed
    
5)Generate Pods
    
    Arbitrarily choose a number of road Pods
        Place them at spaces on the road, give them a type according to either
            the biome or major site
    Check each PoI and roll if it has a Pod attached
        Generate the Pod at the PoI
    Generate some pods at random points on the map
        Generate a path to the nearest road using only bends
    Generate patrols from entrances that the player isn't at
        
6)Generate LootDrops
    
    Arbitrarily place items on generated spaces
        Choose the items based on the tile it's on
    
7)Generate walls

    For every space that hasen't been generated
        Check how close to a space that has a road, PoI tile, or Pod.
        Generate walls with chances dependant on how far it is from these tiles.
        
8)Generate terrain details


9)Generate foliage


10)Generate doodads

   
*/


#define genLevel
randomize()
switch(biomeType){
case 1:
    forestGen(id)
default:
    forestGen(id)

}

poiGen()

riverGen() 




#define podGen

critPathTiles = ds_list_create()
openTiles = ds_list_create()

/*

 other.floorLayout[gridX,gridY].weight = 1
other.floorLayout[gridX,gridY].hasPoi = true
other.floorLayout[gridX,gridY].poi = id 

*/

with(obj_tile){
    if (hasPoi = true){
        if(critPath && poi.hasPod && poi.gridX != gridX && poi.gridY != gridY){
            ds_list_add(other.critPathTiles, id)
        }
        else if (isPath && poi.hasPod && poi.gridX != gridX && poi.gridY != gridY){
            ds_list_add(other.openTiles, id)
        }
    }
    else{
        if(critPath){
            ds_list_add(other.critPathTiles, id)
        }
        else if (isPath){
            ds_list_add(other.openTiles, id)
        }
    }
    
}


k = 0
podList[k] = noone

for(i = 0; i<critPods;i++){
    if !ds_list_empty(critPathTiles)
    {
    rando = irandom(ds_list_size(critPathTiles)-1);
    podList[k] = instance_create(0,0,obj_pod)
    idTemp = ds_list_find_value(critPathTiles, rando)
    podList[k].gridX = idTemp.gridX
    podList[k].gridY = idTemp.gridY
    ds_list_delete(critPathTiles, rando);
    k++
    }
}

for(i = critPods; i<critPods+numPods;i++){
    if !ds_list_empty(openTiles)
    {
        rando = irandom(ds_list_size(openTiles)-1);
        podList[k] = instance_create(0,0,obj_pod)
        idTemp = ds_list_find_value(openTiles, rando)
        podList[k].gridX = idTemp.gridX;
        podList[k].gridY = idTemp.gridY;
        ds_list_delete(openTiles, rando);
        k++
    }
}

ds_list_destroy(critPathTiles)

ds_list_destroy(openTiles)



#define poiGen
//set up the positions of points of interests
i = 0


//critical at index 0
for (i = i;i < array_length_1d(critPoi);i++){
    pois[i] = instance_create(0,0,obj_poi)
    with(pois[i]){
        poiImport(global.currNode.critPoi[other.i])
        entrance = false
    }
}

//pois[0] = poiImport(critPoi) // set up so we can eventually save all the PoIs on the map and import them later



//others at index 1 to x
for (i = array_length_1d(critPoi); i < array_length_1d(critPoi) + poiDensity;i++){
    pois[i] = instance_create(0,0,obj_poi)
    with pois[i]{
        switch(irandom(3)){
            case 0:
               typeScript = smallLoot 
            break
            case 1:
                typeScript = shrineTemp
            break
            case 2:
               typeScript = mediumPod
            break
            case 3:
                typeScript = smallLoot
            break
        }   
        entrance = false
    }
}



//entrances from x+1 on
for (i = array_length_1d(critPoi) + poiDensity; i < numEntrance + array_length_1d(critPoi) + poiDensity; i++){
    pois[i] = instance_create(0,0,obj_poi)
    pois[i].typeScript = mapEntrance
    pois[i].entrance = true
}


for(i =0;i <= ceil(sizeX/global.poiSpacing)- 2;i++){
        for(j = 0;j <= floor(sizeY/global.poiSpacing) - 2;j++){ //create an array of points for POIs to generate on that is set to available
            poiPoints[i,j] = floorLayout[(i*global.poiSpacing)+global.poiSpacing ,(j*global.poiSpacing)+global.poiSpacing];
            poiPoints[i,j].available = true 
    }
}


for (i = 0; i < array_length_1d(pois);i++){
    with (pois[i]){
        script_execute(typeScript)
        genned = false    
        reps = 0
        while (genned = false && reps <= 10){
            reps++
            if(!entrance) {
                tempX = irandom(array_height_2d(other.poiPoints)-1)
                tempY = irandom(array_length_2d(other.poiPoints,0)-1)   //chooses a random poiPoint (every 5 spaces starting 10 from the edge of the map)
                
                if(other.poiPoints[tempX,tempY].available = true){
                    
                    gridX = (tempX*global.poiSpacing)+global.poiSpacing
                    gridY = (tempY*global.poiSpacing)+global.poiSpacing
                    
                    other.floorLayout[gridX,gridY].weight = 1
                    other.floorLayout[gridX,gridY].hasPoi = true
                    other.floorLayout[gridX,gridY].poi = id             //sets the point of this PoI to the earlier random poiPoint
                    
                    for(i = gridX-(ceil(spaceX/2)-1);i <= gridX+(floor(spaceX/2));i++){
                        for(j = gridY-(ceil(spaceY/2)-1);j <= gridY+(floor(spaceY/2));j++){
                            if(i >= 0 && j >= 0 && i < other.sizeX && j < other.sizeY){
                                other.floorLayout[i,j].weight = 2
                                other.floorLayout[i,j].hasPoi = true
                                other.floorLayout[i,j].poi = id         //claims all the tiles in it's space
                            }
                        }
                    }
                    genned = true
                    
                    other.poiPoints[tempX,tempY].available = false //stops other PoIs from claiming it's space
                    
                    if(tempX-1 >= 0){
                        other.poiPoints[tempX-1,tempY].available = false
                    }
                    
                    if(tempX+1 <= array_height_2d(other.poiPoints)-1){
                        other.poiPoints[tempX+1,tempY].available = false
                    }
                    
                    if(tempY-1 >= 0){   
                        other.poiPoints[tempX,tempY-1].available = false
                    }
                        
                    if(tempY+1 <= array_length_2d(other.poiPoints,0)-1){
                        other.poiPoints[tempX,tempY+1].available = false        //stops other PoIs from generating in adjacent spaces
                    }
                    
                }
                
                else{           
                    for(i = 0;i < array_height_2d(other.poiPoints);i++){
                        for(j = 0;j < array_length_2d(other.poiPoints,0);j++){
                            if(other.poiPoints[i,j].available == true){
                                tempX = i
                                tempY = j
                                break
                                break
                            }
                        }
                    }        
                }  
            }
            else{
                var tempSide = choose(0,1,2,3)
                
                tempX = irandom(array_height_2d(other.poiPoints)-1)
                tempY = irandom(array_length_2d(other.poiPoints,0)-1)
                
                switch(tempSide){
                    case 0:
                        tempX = 1
                        tempY = tempY*global.poiSpacing
                        break
                    case 1:
                        tempX = (array_height_2d(other.poiPoints)+1)*global.poiSpacing-1
                        tempY = tempY*global.poiSpacing
                        break
                    case 2:
                    
                        tempX = tempX*global.poiSpacing
                        tempY = 1
                        break
                    case 3:
                        tempX = tempX*global.poiSpacing
                        tempY = (array_length_2d(other.poiPoints,0)+1)*global.poiSpacing-1
                        break
            
                }
                gridX = tempX
                gridY = tempY
            
                other.floorLayout[gridX,gridY].weight = 1
                other.floorLayout[gridX,gridY].hasPoi = true
                other.floorLayout[gridX,gridY].poi = id             //sets the point of this PoI to the earlier random poiPoint
                
                for(i = gridX-(ceil(spaceX/2)-1);i <= gridX+(floor(spaceX/2));i++){
                    for(j = gridY-(ceil(spaceY/2)-1);j <= gridY+(floor(spaceY/2));j++){
                        if(i >= 0 && j >= 0 && i < other.sizeX && j < other.sizeY){
                            other.floorLayout[i,j].weight = 2
                            other.floorLayout[i,j].hasPoi = true
                            other.floorLayout[i,j].poi = id         //claims all the tiles in it's space
                        }
                    }
                }
                genned = true
                
            }
            
            
            if (reps = 10){
                for(i = 0;i < array_height_2d(other.poiPoints);i++){
                        for(j = 0;j < array_length_2d(other.poiPoints,0);j++){
                            if(other.poiPoints[i,j].available == true){
                                tempX = i
                                tempY = j
                                
                                gridX = (tempX*global.poiSpacing)+global.poiSpacing
                                gridY = (tempY*global.poiSpacing)+global.poiSpacing
                            
                                other.floorLayout[gridX,gridY].weight = 1
                                other.floorLayout[gridX,gridY].hasPoi = true
                                other.floorLayout[gridX,gridY].poi = id             //sets the point of this PoI to the earlier random poiPoint
                                
                                for(i = gridX-(ceil(spaceX/2)-1);i <= gridX+(floor(spaceX/2));i++){
                                    for(j = gridY-(ceil(spaceY/2)-1);j <= gridY+(floor(spaceY/2));j++){
                                        if(i >= 0 && j >= 0 && i < other.sizeX && j < other.sizeY){
                                            other.floorLayout[i,j].weight = 2
                                            other.floorLayout[i,j].hasPoi = true
                                            other.floorLayout[i,j].poi = id         //claims all the tiles in it's space
                                        }
                                    }
                                }
                                genned = true
                                break 
                                break
                            }
                        }
                    }
            }
        }
        if (genned != true){
            gridX = irandom(other.sizeX-global.poiSpacing*2)+global.poiSpacing
            gridY = irandom(other.sizeY-global.poiSpacing*2)+global.poiSpacing
            
            other.floorLayout[gridX,gridY].weight = 1
            other.floorLayout[gridX,gridY].hasPoi = true
            other.floorLayout[gridX,gridY].poi = id             //sets the point of this PoI to the earlier random poiPoint
            
            for(i = gridX-(ceil(spaceX/2)-1);i <= gridX+(floor(spaceX/2));i++){
                for(j = gridY-(ceil(spaceY/2)-1);j <= gridY+(floor(spaceY/2));j++){
                    if(i >= 0 && j >= 0 && i < other.sizeX && j < other.sizeY){
                        other.floorLayout[i,j].weight = 2
                        other.floorLayout[i,j].hasPoi = true
                        other.floorLayout[i,j].poi = id         //claims all the tiles in it's space
                    }
                }
            }
            genned = true
        }
        
        if(hasPod = true){
            i = instance_create(0,0,obj_pod)
            i.gridX = gridX
            i.gridY = gridY
        }
        
        if (loot != noone){
            createItem(gridX*16+8, gridY*16+8, loot, noone)
        }
    
    
    }
}

/*with(obj_poi){
    for(i = gridX-(ceil(spaceX/2)-1);i <= gridX+(floor(spaceX/2));i++){
        for(j = gridY-(ceil(spaceY/2)-1);j <= gridY+(floor(spaceY/2));j++){
            if(i >= 0 && j >= 0 && i < other.sizeX && j < other.sizeY){
                other.floorLayout[i,j].weight = 2
                other.floorLayout[i,j].hasPoi = true
                other.floorLayout[i,j].poi = id
            }
        }
    }
    other.floorLayout[gridX,gridY].weight = 1
    other.floorLayout[gridX,gridY].hasPoi = true
}*/

#define riverGen
for (var i = 0;i < numRivers;i++){
    switch(irandom(3)){
        case 0:
            rivers[i,0] = 0
            rivers[i,1] = irandom(sizeY-1)
            break
            
        case 1:
            rivers[i,0] = sizeX-1
            rivers[i,1] = irandom(sizeY-1)
            break
            
        case 2:
            rivers[i,0] = irandom(sizeX-1)
            rivers[i,1] = 0
            break
        
        case 3:
            rivers[i,0] = irandom(sizeX-1)
            rivers[i,1] = sizeY-1
            break
        }
        
        switch(irandom(3)){
        case 0:
            rivers[i,2] = irandom(sizeX-1)
            rivers[i,3] = irandom(sizeY-1)
            break
            
        default:
            switch(irandom(3)){
            case 0:
                rivers[i,2] = 0
                rivers[i,3] = irandom(sizeY-1)
                break
                
            case 1:
                rivers[i,2] = sizeX-1
                rivers[i,3] = irandom(sizeY-1)
                break
                
            case 2:
                rivers[i,2] = irandom(sizeX-1)
                rivers[i,3] = 0
                break
            
            case 3:
                rivers[i,2] = irandom(sizeX-1)
                rivers[i,3] = sizeY-1
                break
            }
            break
            
        }
        
        
}


#define forestGen
//Generation specific to forests

//Set the A* heuristic for each tile


//floor tile setup
//for (var i=0; i<sizeX; i++){
   // for (var j=0; j<sizeY; j++){
        /*floorLayout[i,j].weight = choose(2,2,2,2,2,2,3,3,6,7,8,8)
        floorLayout[i,j].rWeight = choose(1,1,2,2,3,3,4)
        floorLayout[i,j].g = 0
        floorLayout[i,j].gridX = i
        floorLayout[i,j].gridY = j
        floorLayout[i,j].isPath = false
        floorLayout[i,j].isRiver = false
        floorLayout[i,j].hasPoi = false*/
        
with(obj_tile){      
    weight = choose(2,2,2,2,2,3,3,3,3,4,4,4,5,6,7,8,9,10)
    rWeight = choose(1,1,2,2,3,3,4)
    g = 0
    isPath = false
    isRiver = false
    hasPoi = false   
    critPath = false  
    }   