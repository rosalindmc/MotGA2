#define pointOfInterest


#define poiInitialize
type = poiType.none //Type of point of interest
typeScript = emptyPoi

gridX = x
gridY = y

spaceX = 5
spaceY = 5  //needed space

buffer = 0  //the amount of space this has around it before it should generate walls.

furnitureArr[0] = 0
mobsArr[0] = 0;

entrance = false

critical = false    //whether or not this is the critical PoI

hasPod = false   //whether or not this has a pod spawn

boss = 0        //whether or not this has a boss

loot = noone      //whether or not this has a special item

roads = 0       //whether or not this has roads

genned = false    
reps = 0



#define poiImport

type = argument0.type //Type of point of interest
typeScript = argument0.typeScript

gridX = argument0.gridX
gridY = argument0.gridY

spaceX = argument0.spaceX
spaceY = argument0.spaceY  //needed space

buffer = argument0.buffer  //the amount of space this has around it before it should generate walls.

critical = argument0.critical    //whether or not this is the critical PoI

hasPod = argument0.hasPod   //whether or not this has a pod spawn

boss = argument0.boss        //whether or not this has a boss

loot = argument0.loot        //whether or not this has a special item

roads = argument0.roads      //whether or not this has roads



#define createPoi
ret = noone


switch(argument0){
default:
    ret = instance_create(0,0,obj_poi)
    with(ret){
        typeScript = smallLoot
    }
break
case 1:
    ret = instance_create(0,0,obj_poi)
    with(ret){
        typeScript = shrineTemp
    }
break
case 10:
    ret = instance_create(0,0,obj_poi)
    with(ret){
        typeScript = miniBossTemp
    }
break
case 11:
    ret = instance_create(0,0,obj_poi)
    with(ret){
        typeScript = specItemTemp
    }
break
case 12:
    ret = instance_create(0,0,obj_poi)
    with(ret){
        typeScript = specCharTemp
    }
break
case 13:
    ret = instance_create(0,0,obj_poi)
    with(ret){
        typeScript = dungeonTemp
    }
break
}


return ret