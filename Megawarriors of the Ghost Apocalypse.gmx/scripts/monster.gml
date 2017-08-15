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

vitality = 2
might = 3
wit = 1
endurance = 3
magic = 1
charisma = 1

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

vitality = 3
might = 2
wit = 1
endurance = 4
magic = 1
charisma = 1

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

vitality = 1
might = 2
wit = 2
endurance = 4
magic = 1
charisma = 1

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
