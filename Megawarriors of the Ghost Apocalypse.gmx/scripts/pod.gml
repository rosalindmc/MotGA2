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


for(i = 0; i < array_length_1d(members);i++){
        switch(irandom(7)){
            case 0:
                createChar(gridX*metre+8+(i*8), gridY*16+8, members[i], noone)
                break
            case 1:
                createChar(gridX*metre+8-(i*8), gridY*16+8, members[i], noone)
                break
            case 2:
                createChar(gridX*metre+8, gridY*16+8+(i*8), members[i], noone)
                break
            case 3:
                createChar(gridX*metre+8, gridY*16+8-(i*8), members[i], noone)
                break
            case 4:
                createChar(gridX*metre+8+(i*8), gridY*16+8+(i*8), members[i], noone)
                break
            case 5:
                createChar(gridX*metre+8+(i*8), gridY*16+8-(i*8), members[i], noone)
                break
            case 6:
                createChar(gridX*metre+8-(i*8), gridY*16+8-(i*8), members[i], noone)
                break
            case 7:
                createChar(gridX*metre+8-(i*8), gridY*16+8+(i*8), members[i], noone)
                break
        }
        //set up leadership stuff
}