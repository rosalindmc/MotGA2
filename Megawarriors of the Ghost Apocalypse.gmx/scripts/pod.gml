#define pod


#define podInit
type = soloDarkSoldier
leader = noone
gridX = 0
gridY = 0

xpValue = 0
members[0] = noone

faction = noone
respawn = false

#define podSpawn
var newChar = noone;
if(point_distance(gridX*metre+8,gridY*metre+8, global.pc.x, global.pc.y)>global.safezone*metre){
    for(i = 0; i < array_length_1d(members);i++){
        switch(irandom(7)){
            case 0:
                newChar = createChar(gridX*metre+8+(i*8), gridY*16+8, members[i], noone)
                break
            case 1:
                newChar = createChar(gridX*metre+8-(i*8), gridY*16+8, members[i], noone)
                break
            case 2:
                newChar = createChar(gridX*metre+8, gridY*16+8+(i*8), members[i], noone)
                break
            case 3:
                newChar = createChar(gridX*metre+8, gridY*16+8-(i*8), members[i], noone)
                break
            case 4:
                newChar = createChar(gridX*metre+8+(i*8), gridY*16+8+(i*8), members[i], noone)
                break
            case 5:
                newChar = createChar(gridX*metre+8+(i*8), gridY*16+8-(i*8), members[i], noone)
                break
            case 6:
                newChar = createChar(gridX*metre+8-(i*8), gridY*16+8-(i*8), members[i], noone)
                break
            case 7:
                newChar = createChar(gridX*metre+8-(i*8), gridY*16+8+(i*8), members[i], noone)
                break
        }
        //set up leadership stuff
        if(argument0){
            with(newChar){
                postCharInit();
            }
    
        }
    }
}
