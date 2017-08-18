#define char


#define createChar
/*
use as createChar(x,y,type, leader)
pods should generate from leader down, creating the leader with the pod ID and the mooks with the leader ID
summons should just be given their leader's ID

*/

var i,ii;

i = instance_create(argument0, argument1, obj_char)
i.type = argument2
with(i){
    aiInitialize()
    script_execute(argument2,0)
    
    if (argument3 != noone){
        leader = argument3
        leader.subordinate[array_length_1d(leader.subordinate)] = id
    }
    
    //charSetup()
}

return(i);


#define charInitialize
//Art Essentials
animType = humanoid
animUpdate = true

//Temp Run animType Initialize (move to a create char script later so this can be adjusted)
script_execute(animType,0)

//Movement Essentials
movement = 7        //Metres per second
moveMult = 1        //Malleable multiplier for movement speed
moveDT = 0          //Difficult terrain divider

floorZ = 0
floorID = -4
z = 0
hspd = 0
vspd = 0
zspd = 0
fric = 4            //% per second
accel = 4           //% max speed gained per second of acceleration

canMove = true      //Can move check
moveTimer = 0
canAttack = true    //Can attack check

staggered = false

canRoll = true
dodgeCost = 1
dodgeSpeed = 16
dodgeTimer = 0
recentDodge = 0

//Animations
animIndex[0] = humanoidWalk    //Current animation (For Legs+Body)
animStep[0] = 0     //Current animation step
animDelay[0] = 0    //How many seconds to next step
animSpeed[0] = 1    //Multiplier for animation speed (can be negative)

animIndex[1] = weaponIdle    //Right Hand
animStep[1] = 0     
animDelay[1] = 1    
animSpeed[1] = 1    

animIndex[2] = weaponIdle    //Left Hand
animStep[2] = 0     
animDelay[2] = 1    
animSpeed[2] = 1    

bodyTwist = 0
greatWeapon = false

//Targeting Essentials
targetX = x
targetY = y

vFacing = 0
hFacing = 1
facing = 0

turnSpeed = 360     //Degrees/second

//Control Script
controlScript = playerControl       //Temp, replace with ai control
player = true                       //Change to false in type script
gpTarget = noone;                   //This is so that if a player is using a controller, they can select an enemy


lastAttack = 0                      //When this character last attacked for the AI
inFormation = false                 //flag for being in a formation
joinsFormation = false
leader = noone

//Character stats
vitality = 1
might = 1
wit = 1
endurance = 1
magic = 1
charisma = 1

stealth = 1

//Vitals
life = 12
lifeMax = 12
lifeRegen = 0.0 //per second

stam = 4
stamMax = 4    
stamRegen = 3.0   //per second
stamDelay = 0.0

stability = 1.0
stabilityMax = 1.0
stabilityRegen = 3.0
stabilityDelay = 0.0
recovery = 5.0
staggerRecovery = 0.0

armour = 1.0
physicalResist = 1.0
magicResist = 1.0

for(i = 0; i<=13; i++){
    damageResist[i] = 1.0
}

//Fighting
hold[1] = 0
hold[2] = 0
charge[1] = 0
charge[2] = 0
meleeSwing[1] = 1
meleeSwing[2] = -1
queuedAnim[1] = -4
queuedAnim[2] = -4
strike[1] = 0
strike[2] = 0
sweetSpot = false
fumble = false
perfectTimeMod = .5
kick = 0

grappling = false
grappled = false
grappler = noone        //person grappling you
grappleTarg = noone     //person you are grappling

//Inventory
canInv = true
inventorySize = 10
for(i = 0; i < inventorySize; i++)
{
    inventory[i] = noone
}
handItem[1] = noone
handItemSlot[1] = -1
handItem[2] = noone
handItemSlot[2] = -1

hoverItem = 0
pointInteract = noone

interactId = noone

//Status Effects
sEffect = ds_list_create()




#define charSetup
//Vitals
switch (type){
    case 'mook':
        lifeMax = 2+vitality
        life = lifeMax
        
        stamMax = endurance    
        stam = stamMax
        
        damageMod = 1 + (might-4)*0.05
        impactMod = 1 + (might-4)*0.2
        
        penMod = 1 + (wit - 4) * 0.025
        
        physicalResist = 1 + (endurance-4)*0.05
        magicResist = 1 + (magic-4)*0.05
        
        break;
    
    case 'megawarrior':
        
        lifeMax = 4+(2*vitality)
        life = lifeMax
        
        stamMax = endurance    
        stam = stamMax
        
        damageMod = 1 + (might-4)*0.1
        impactMod = 1 + (might-4)*0.2  
        
        penMod = 1 + (wit - 4) * 0.05
        
        physicalResist = 1 + (endurance-4)*0.05
        magicResist = 1 + (magic-4)*0.05
    
        break
    
    case 'boss':
        
        lifeMax = 6+(4*vitality)
        life = lifeMax
        
        stamMax = endurance    
        stam = stamMax
        
        damageMod = 1 + (might-4)*0.15
        impactMod = 1 + (might-4)*0.2  
    
        penMod = 1 + (wit - 4) * 0.05
        
        physicalResist = 1 + (endurance-4)*0.05
        magicResist = 1 + (magic-4)*0.05
        
        break
    
    default:
        break
    
}

#define charStep
//MoveLimit
moveLimit()

//Execute Control Script
script_execute(controlScript)

//Facing
var tS = turnSpeed;

tS /= 1+max(charge[1],charge[2])

if max(strike[1],strike[2]) = 1 or dodgeTimer != 0
{
    tS = 0
}

if grappled = false
{
        facing = rotate(facing,point_direction(x,y,targetX,targetY),tS/global.frameRate)
}

//Movement
moveStep()
isoDepth(0)

/*
script_execute(control)
charFacing()

/*
if hp > hpMax
{
    hp = hpMax
}

if spDelay = 0
{
    sp = min(spMax,sp+(spRegen/global.frameRate))
}
else
{
    spDelay = max(0,spDelay-(1/global.frameRate))
}

if pc = true
{
    fire = min(100,fire+(2/global.frameRate))
}

if canAttack = true
{
    kick = max(0,kick-(10/global.frameRate))
}

kick = min(10,kick)

if hp <= 0
{
    if pc = true
    {
        room_speed = global.frameRate/2
        obj_control.black += .5/global.frameRate
        canMove = false
        canAttack = false
        
        if vis = true
        {
        obj_control.black = 0
        i = instance_create(x,y,obj_corpse)
        i.hspd = hspd
        i.vspd = vspd
        i.zspd = zspd
        i.facingH = facingH
        i.facingV = facingV
        with(i){scr_humanoid(0)}
        i.charSprite = charSprite
        i.anim[0] = scr_humanoidDeath
        i.anim[1] = scr_swordIdle
        i.alarm[0] = 1
        i.alarm[1] = -4
        
        vis = false
            if instance_exists(invSlot[invSelect])
            {
                with(invSlot[invSelect])
                {
                scr_dropItem()
                }
            }
        }
    }
    else
    {
        audio_play_sound(deathSound,0,false)
    
        i = instance_create(x,y,obj_corpse)
        i.hspd = hspd
        i.vspd = vspd
        i.zspd = zspd
        i.facingH = facingH
        i.facingV = facingV
        with(i){scr_humanoid(0)}
        i.charSprite = charSprite
        i.anim[0] = scr_humanoidDeath
        i.alarm[0] = 1

        repeat(arrows)
        {
            instance_create(x-5+random(10),y-5+random(10),obj_arrowPickup)
        }
        
        instance_destroy()
        

    }
}

//Set Terrain to whatever the Grid Tile is (add exception for spots)
dTerrain = grid.difficult

#define charEndstep
//Animate
animEndStep(0)
animEndStep(1)
animEndStep(2)

//Animation Control (clean up and move somewhere else)
if canMove = true
{
    if moving != 0
    {
        animIndex[0] = humanoidWalk
        animSpeed[0] = max(abs(moving),1)
        if animStep[0] > 4
        {
            animStep[0] = 1
        }
    }
    else
    {
        if animIndex[0] != humanoidIdle
        {
            animationStart(humanoidIdle,0)
        }
    }
}

//Misc Timers
recentDodge = max(recentDodge-1/global.frameRate,0)

if dodgeTimer > 0
{
    dodgeTimer -= 1/global.frameRate
    
    if dodgeTimer <= 0
    {
        dodgeTimer = 0
        recentDodge = .3
        facing = point_direction(x,y,targetX,targetY)
        
        //Special: make dodge attacks easier for players to use
        if player = true
        {
            if hold[1] != 0 and lftclickKey = false
            {
                useItem(1,1)  
            }
            if hold[2] != 0 and rgtclickKey = false
            {
                useItem(2,1)  
            }
        }
    }
}

if moveTimer > 0
{
    moveTimer -= 1/global.frameRate
    
    if moveTimer <= 0
    {
        canMove = true        
    }
}

//Stamina Regeneration
if stamDelay = 0
{
    stam = min(stamMax,stam+(stamRegen/global.frameRate))
    
    if moving = 0
    {
        stam = min(stamMax,stam+(stamRegen/global.frameRate))
    }
}
else
{
    stamDelay = max(0,stamDelay-(1/global.frameRate))
}

if (grappled = true){
    if instance_exists(grappler)
    {
        facing = grappler.facing+180
        if x != grappler.handX[2]+round(grappler.x)-(grappler.charSurfSize*.5)+lengthdir_x(max(metre,handDist[2]),grappler.facing+grappler.handDir[2])
        {
            hspd = grappler.handX[2]+round(grappler.x)-(grappler.charSurfSize*.5)+lengthdir_x(max(metre,handDist[2]),grappler.facing+grappler.handDir[2])-x
        }
        if y != grappler.handY[2]+round(grappler.y)-(grappler.charSurfSize*.5)+lengthdir_y(max(metre,handDist[2]),grappler.facing+grappler.handDir[2])+z
        {
            vspd = grappler.handY[2]+round(grappler.y)-(grappler.charSurfSize*.5)+lengthdir_y(max(metre,handDist[2]),grappler.facing+grappler.handDir[2])-y+z
        }
        z = (grappler.charSurfSize*.75)-round(grappler.bodyY+grappler.handHeight[2]+grappler.z)
    }
}



#define charDestroy
//Clear the drawing surface
surface_free(charSurf)
ds_list_destroy(sEffect)
aiDestroy()

for(i = 0; i < inventorySize; i++)
{
    if (inventory[i] != noone){
        inventory[i].owner = noone
        ii = instance_create(x,y,obj_interactable)
        ii.owner = inventory[i]
        ii.name = inventory[i].name
        ii.useType = pickUp
        inventory[i].interactId = ii
        inventory[i] = noone    
    }
}



#define charDraw
//Draw Character
if animUpdate = true
{
    script_execute(animType,1)
    animUpdate = true   //This feature might go unused
}

//Shadow
draw_sprite(spr_shadow,0,round(x),round(y)-floorID.wz)

if player = true
{
    draw_set_colour(c_yellow)
    draw_ellipse(round(x-5),round(y-2)-floorID.wz,round(x+3),round(y+2)-floorID.wz,false)
}

//Draw Surface
draw_surface_ext(charSurf,round(x-(charSurfSize*.5)),round(y-(charSurfSize*.75))-z,1,1,0,c_white,1)

if global.liveSurf = true
{
    //Draw Block
    if surface_exists(global.blockSurf)
    {
        surface_set_target(global.blockSurf)
        draw_surface(charSurf,round(x-(charSurfSize*.5))-global.liveSurfX1,round(y-(charSurfSize*.75))-global.liveSurfY1-z)   
        draw_sprite(spr_shadow,0,round(x)-global.liveSurfX1,round(y)-global.liveSurfY1)     
        surface_reset_target()
    }
    
    //Draw Reflection
    if surface_exists(global.reflectSurf)
    {
        surface_set_target(global.reflectSurf)
        draw_surface_ext(charSurf,round(x-(charSurfSize*.5))-global.liveSurfX1,round(y+(charSurfSize*.75))-global.liveSurfY1+z,1,-1,0,c_white,1)
        surface_reset_target()
    }
}

//draw_text(x,y+10,string(floor(hspd))+string('m'))
//draw_text(x,y+20,string(floor(vspd))+string('m'))
//draw_text(x,y+30,canMove)

/*Temp just draw random stuff
draw_set_colour(c_white)
draw_rectangle(round(x)-4,round(y)-16,round(x)+4,round(y),false)
draw_text(round(x),round(y)+20,global.frameRate)
draw_text(round(x),round(y)+30,moving*global.frameRate/metre)

#define charDrawEnd
smallHealthBar()

#define smallHealthBar
if player = false
{
    ix = round(x)
    iy = round(y-(metre*2))
    
    i = 0
    repeat(ceil(life))
    {
        draw_sprite_ext(spr_smallhealth,0,ix-10+(4*i),iy,1,1,0,c_white,life-i)
        i += 1
    }
    
    //Outline
    draw_set_colour(c_black)
    draw_rectangle(ix-10,iy-3,ix-10+(4*lifeMax),iy+3,true)
    
    //Stamina
    i = 0
    repeat(ceil(stamMax))
    {
        draw_set_colour(uiStaminaGreen)
        draw_rectangle(ix-10+(5*i)+(3*floor(i*.5)),iy+5,ix-10+(5*median(0,stam-i,1))+(5*i)+(3*floor(i*.5)),iy+7,false)
        
        //Outline
        draw_set_colour(c_black)
        draw_rectangle(ix-10+(5*i)+(3*floor(i*.5)),iy+5,ix-10+5+(5*i)+(3*floor(i*.5)),iy+7,true)        
        i += 1
    }
}   