#define worldNode


#define nodeInit
    biomeType = 1
    element = 0
    sizeX = 50
    sizeY = 50
    
    critPoi [0] = 1     //the type of the critical point of interest
    poiDensity = 10     //number of non-critical points of interest on the map
    numEntrance = 3
    pois[0]=0
    numRivers = 4

    rivers[numRivers,4] = 0    //number of indexes is to support x1,y1,x2,y2 for each river
    
    
    critPods = 0    //number of pods on the critical path
    podDensity = 0  //number of pods on the map
    
    itemDensity = 0 //number of item spawns on the map
    
    specialAreas = 0   //number of special areas to spawn
    
    floorLayout[sizeX,sizeY] = 0    //the map of floors and walls

#define nodeGen
// set up critPods based on challenge
// itemDensity
// specialAreas