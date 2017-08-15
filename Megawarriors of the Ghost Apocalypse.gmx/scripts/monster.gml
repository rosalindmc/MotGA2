#define monster
player = false
controlScript = aiControl

#define darkSoldier
player = false
controlScript = aiControl

behaviorType = carefulSoldier

life = 5
lifeMax = 5

stam = 4
stamMax = 4
stamRegen = 1.0

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

i = createItem(x,y,sword,id)

script_execute(behaviorType)

#define dreadPike
player = false
controlScript = aiControl

behaviorType = corrallingSoldier

life = 5
lifeMax = 5

stam = 4
stamMax = 4
stamRegen = 1.0

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

script_execute(behaviorType)

#define blackArrow
player = false
controlScript = aiControl

behaviorType = testArcher

life = 5
lifeMax = 5

stam = 4
stamMax = 4
stamRegen = 1.0


stealth = 0.5
hearing = 1

centerVisionRange = 10
sideVisionRange = 5

responseTime = 2
responseStart = global.timer + random(responseTime)

canRoll = false

subordinate[0] = noone

i = createItem(x,y,khopesh,id)

script_execute(behaviorType)