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


stealth = 0.5
hearing = 1

centerVisionRange = 10
sideVisionRange = 5

responseTime = 2
responseStart = global.timer

canRoll = false

subordinate[0] = noone

i = createItem(x,y,sword,id)

script_execute(behaviorType)
