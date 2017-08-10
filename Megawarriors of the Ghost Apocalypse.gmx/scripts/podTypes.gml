#define podTypes


#define podTypeSelect
//choose the type in here somehow
var tempPod = noone

tempPod = choose(soloDarkSoldier,soloDreadPike)

script_execute(tempPod)


#define soloDarkSoldier
leader = noone
members[0] = darkSoldier
xpValue = 1

#define soloDreadPike
leader = noone
members[0] = dreadPike
xpValue = 1
