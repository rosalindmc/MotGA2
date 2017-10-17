#define monster
player = false
controlScript = aiControl
team = 2
agroRange = 10


#define darkSoldier
player = false
controlScript = aiControl
type = 'mook'

behaviorType = carefulSoldier

vitality = 3
might = 3
wit = 2
endurance = 3
magic = 2
charisma = 2
randomizeStats(3)
xpReward = 1.0


//Appearance Info
clothingSprite = choose(spr_darkSoldier,spr_darkSoldier2)
skirtSprite = spr_none
hairSprite = spr_none
helmSprite = spr_soldierHelm

agroRange = 10
stealth = 0.5
hearing = 1

centerVisionRange = 10
sideVisionRange = 5

responseTime = 2
responseStart = global.timer + random(responseTime)

canRoll = false

subordinate[0] = noone

i = createItem(x,y,choose(sword,bigSword,circleySword,axe,throwyAxe,mace,spear),id)

charSetup()

script_execute(behaviorType)

#define dreadPike
player = false
controlScript = aiControl
type = 'mook'

behaviorType = corrallingSoldier

vitality = 3
might = 3
wit = 2
endurance = 4
magic = 2
charisma = 3
randomizeStats(3)
xpReward = 1.2

//Appearance Info
clothingSprite = choose(spr_dreadPike,spr_dreadPike2)
skirtSprite = spr_none
hairSprite = spr_none
helmSprite = spr_pikeHelm

agroRange = 10
stealth = 0.5
hearing = 1
armour = 25

centerVisionRange = 10
sideVisionRange = 5

responseTime = 2
responseStart = global.timer + random(responseTime)

canRoll = false

subordinate[0] = noone
joinsFormation = true

i = createItem(x,y,pike,id)
handItem[2] = i
greatWeapon = true
charSetup()

script_execute(behaviorType)

#define blackArrow
player = false
controlScript = aiControl
type = 'mook'

behaviorType = testArcher


//Appearance Info
clothingSprite = choose(spr_darkSergeant)
skirtSprite = spr_none

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

#define stormtrooper
player = false
controlScript = aiControl
type = 'mook'

behaviorType = carefulSoldier

vitality = 4
might = 4
wit = 3
endurance = 4
magic = 3
charisma = 3
randomizeStats(4)
xpReward = 2.5

//Appearance Info
clothingSprite = spr_stormtrooper
skirtSprite = spr_none
hairSprite = spr_none
helmSprite = spr_stormHelm

agroRange = 10
stealth = 0.5
hearing = 1
armour = 75

centerVisionRange = 10
sideVisionRange = 5

responseTime = 1
responseStart = global.timer + random(responseTime)

canRoll = false

subordinate[0] = noone

i = createItem(x,y,choose(biggerSword,longAxe,warhammer),id)
handItem[2] = i
greatWeapon = true
charSetup()

script_execute(behaviorType)