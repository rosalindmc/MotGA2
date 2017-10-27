#define world


#define worldInit
//
nodeArray[0] = noone
villain = noone

biomePref = 0
elemPref = 0


#define worldGen
// potential to take arguments for presets and special rules

//put the switch here, based on BiomePref and ElemPref
biomeList = ds_list_create();
qualiList = ds_list_create();

ds_list_add(biomeList, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
ds_list_add(qualiList, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0 ,0);

for(i = 0; i <= global.numNodes; i++){

//make the next node
    nodeArray[i] = instance_create(0,0,obj_node)
    
//give it a biome and qualifier
    var rando = irandom(ds_list_size(biomeList));
    nodeArray[i].biomeType = ds_list_find_value(biomeList, rando);
    ds_list_delete(biomeList, rando);
    
    var rando = irandom(ds_list_size(qualiList));
    nodeArray[i].element = ds_list_find_value(qualiList, rando);
    ds_list_delete(qualiList, rando);
    
//give it crit PoI
    nodeArray[i].critPoi[1] = createPoi(irandom(3)+10)
    nodeArray[i].critPoi[0] = createPoi(1)

//give it a difficulty based on i + critPoi[0] + qualifier
    nodeArray[i].challenge = 1
    if (i > 3){
        nodeArray[i].challenge++
    }
    if (nodeArray[i].critPoi[0] == 10){
        nodeArray[i].challenge++    
    }
    if (nodeArray[i].critPoi[0] == 13){
        nodeArray[i].challenge++    
    }
    
//use the biome and qualifier to give it its other things
    with(nodeArray[i]){
        biomeDeets()
    }


}

global.currNode = nodeArray[global.currNodeIndex]

ds_list_destroy(biomeList);
ds_list_destroy(qualiList);


#define biomeDeets
switch(biomeType){
    case 0:
        nodeGen()
        numEntrance = choose(1,2,2,2,3,4)
        numRivers = choose(0,1,2,2,3)
    break
    
    case 1:
        nodeGen()
        numEntrance = 3//choose(1,2,2,2,3,4)
        numRivers = choose(0,1,2,2,3)
        
    break

}