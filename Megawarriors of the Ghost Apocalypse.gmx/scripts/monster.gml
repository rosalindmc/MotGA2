#define monster
player = false
controlScript = aiControl

#define darkSoldier
player = false
controlScript = aiControl

behaviorType = testBehavior

life = 5
lifeMax = 5

stam = 2
stamMax = 2
stamRegen = 1.0


stealth = 0.5
hearing = 1

centerVisionRange = 10
sideVisionRange = 5

responseTime = 2
responseStart = global.timer

canRoll = false

subordinate[0] = noone

script_execute(behaviorType)