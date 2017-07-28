#define pointOfInterest


#define poiInitialize
type = poiType.none //Type of point of interest

gridX = x
gridY = y

spaceX = 5
spaceY = 5  //needed space

buffer = 0  //the amount of space this has around it before it should generate walls.

entrance = false

critical = false    //whether or not this is the critical PoI

podSpawn = 0    //whether or not this has a pod spawn

boss = 0        //whether or not this has a boss

loot = 0        //whether or not this has a special item

roads = 0       //whether or not this has roads



#define poiImport
type = argument0.type //Type of point of interest

gridX = argument0.gridX
gridY = argument0.gridY

spaceX = argument0.spaceX
spaceY = argument0.spaceY  //needed space

buffer = argument0.buffer  //the amount of space this has around it before it should generate walls.

critical = argument0.critical    //whether or not this is the critical PoI

podSpawn = argument0.podspawn    //whether or not this has a pod spawn

boss = argument0.boss        //whether or not this has a boss

loot = argument0.loot        //whether or not this has a special item

roads = argument0.roads      //whether or not this has roads