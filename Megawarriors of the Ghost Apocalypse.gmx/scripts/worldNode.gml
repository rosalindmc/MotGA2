#define worldNode


#define nodeInit
    biomeType = 1
    element = 0
    sizeX = 40
    sizeY = 40
    
    critPoi [0] = noone     //the type of the critical point of interest
    poiDensity = 10     //number of non-critical points of interest on the map
    numEntrance = 3
    pois[0]=0
    numRivers = 4

    rivers[numRivers,4] = 0    //number of indexes is to support x1,y1,x2,y2 for each river
    
    
    critPods = 0    //number of pods on the critical path
    podDensity = 0  //number of pods on the map
    podPower = 0    //average power of each pod
    numPods = 0     //absolute number of pods on the map, should be aboue twice the number of crit pods
    
    
    itemDensity = 0 //number of item spawns on the map
    
    specialAreas = 0   //number of special areas to spawn
    
    floorLayout[sizeX,sizeY] = 0    //the map of floors and walls

#define nodeGen
// set up critPods based on challenge
podPower = choose (0,1,1,1,2,2,3)+challenge //1-7
podDensity = random(2)+1
critPods = podDensity*2
numPods = critPods*2
// itemDensity
// specialAreas
