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

}

poiGen()

riverGen() 






#define poiGen
//set up the positions of points of interests
var i = 0
//critical at index 0
for (i = i;i < array_length_1d(critPoi[]);i++){
    pois[i] = instance_create(0,0,obj_poi)
    //poiImport(critPoi[i])
}

//pois[0] = poiImport(critPoi) // set up so we can eventually save all the PoIs on the map and import them later



//others at index 1 to x
for (i = i; i < array_length_1d(critPoi[]) + poiDensity;i++){
    pois[i] = instance_create(0,0,obj_poi)
}


//entrances from x+1 on
for (i = i; i < numEntrance + array_length_1d(critPoi[]) + poiDensity; i++){
    switch(i%4){
        case 0:
            pois[i] = instance_create(0,0,obj_poi)
            break
        case 1:
            pois[i] = instance_create(0,0,obj_poi)
            break
        case 2:
            pois[i] = instance_create(0,0,obj_poi)
            break
        case 3:
            pois[i] = instance_create(0,0,obj_poi)
            break
            
    }
    pois[i].entrance = true;
    pois[i].spaceX = 3
    pois[i].spaceY = 3
}


for(i =0;i <= ceil(sizeX/5)- 2;i++){
        for(j = 0;j <= floor(sizeY/5) - 2;j++){ //create an array of points for POIs to generate on that is set to available
            poiPoints[i,j] = floorLayout[(i*5)+5 ,(j*5)+5];
            poiPoints[i,j].available = true 
    }
}


with(obj_poi){

    genned = false    
    reps = 0
    while (genned = false && reps <= 10){
        reps++
        if (!entrance){
            tempX = irandom(array_height_2d(other.poiPoints)-1)
            tempY = irandom(array_length_2d(other.poiPoints,0)-1)   //chooses a random poiPoint (every 5 spaces starting 10 from the edge of the map)
            
            if(other.poiPoints[tempX,tempY].available = true){
                
                gridX = (tempX*5)+5
                gridY = (tempY*5)+5
            
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
        else {
            var tempSide = choose(0,1,2,3)
            
            tempX = irandom(array_height_2d(other.poiPoints)-1)
            tempY = irandom(array_length_2d(other.poiPoints,0)-1)
            
            switch(tempSide){
                case 0:
                    tempX = 0.2
                    break
                case 1:
                    tempX = array_height_2d(other.poiPoints)+0.6
                    break
                case 2:
                    tempY = 0.2
                    break
                case 3:
                    tempY = array_length_2d(other.poiPoints,0)+0.6
                    break
        
            }
            gridX = (tempX*5)
            gridY = (tempY*5)
        
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
                            
                            gridX = (tempX*5)+5
                            gridY = (tempY*5)+5
                        
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
        gridX = irandom(other.sizeX-10)+5
        gridY = irandom(other.sizeY-10)+5
        
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
    weight = choose(2,2,2,2,2,2,3,3,6,7,8,8)
    rWeight = choose(1,1,2,2,3,3,4)
    g = 0
    gridX = x
    gridY = y
    isPath = false
    isRiver = false
    hasPoi = false     
    }   
