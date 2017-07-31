#define pod


#define podInit
type = soloDarkSoldier
leader = noone
gridX = 0
gridY = 0

xpValue = 0
members[0] = noone

faction = noone


#define podSpawn


for(i = 0; i < array_length_1d(members);i++){

        createChar(gridX*16+8, gridY*16+8, members[i], noone)
        //set up leadership stuff
}


