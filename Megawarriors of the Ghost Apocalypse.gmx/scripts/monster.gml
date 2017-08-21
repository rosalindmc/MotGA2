#define monster
player = false
controlScript = aiControl

#define darkSoldier
player = false
controlScript = aiControl
type = 'mook'

behaviorType = carefulSoldier

vitality = 3
might = 3
wit = 3
endurance = 3
magic = 3
charisma = 3

//Appearance Info
clothingSprite = choose(spr_darkSoldier,spr_darkSoldier2)
skirtSprite = spr_none
hairSprite = spr_none


stealth = 0.5
hearing = 1

centerVisionRange = 10
sideVisionRange = 5

responseTime = 2
responseStart = global.timer + random(responseTime)

canRoll = false

subordinate[0] = noone

i = createItem(x,y,choose(sword,bigSword,biggerSword,circleySword,axe,longAxe,throwyAxe,mace,warhammer,spear),id)

charSetup()

script_execute(behaviorType)

#define dreadPike
player = false
controlScript = aiControl
type = 'mook'

behaviorType = corrallingSoldier

vitality = 3
might = 3
wit = 3
endurance = 3
magic = 3
charisma = 3

//Appearance Info
clothingSprite = choose(spr_dreadPike,spr_dreadPike2)
skirtSprite = spr_none
hairSprite = spr_none


stealth = 0.5
hearing = 1

centerVisionRange = 10
sideVisionRange = 5

responseTime = 2
responseStart = global.timer + random(responseTime)

canRoll = false

subordinate[0] = noone
joinsFormation = true

i = createItem(x,y,pike,id)

charSetup()

script_execute(behaviorType)

#define blackArrow
player = false
controlScript = aiControl
type = 'mook'

behaviorType = testArcher

vitality = 3
might = 3
wit = 3
endurance = 3
magic = 3
charisma = 3

stealth = 0.5
hearing = 1

centerVisionRange = 10
sideVisionRange = 5

responseTime = 2
responseStart = global.timer + random(responseTime)

canRoll = false

subordinate[0] = noone

i = createItem(x,y,sword,id)

charSetup()

script_execute(behaviorType)
