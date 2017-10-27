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
alive = true
corpse = false
shadowSprite = spr_shadow

//Temp Run animType Initialize (move to a create char script later so this can be adjusted)
script_execute(animType,0)

//Movement Essentials
movement = 6        //Metres per second
moveMult = 1        //Malleable multiplier for movement speed
moveDT = 0          //Difficult terrain divider
moving = 0

floorZ = 0
floorID = -4

z = 0
wz = 0
hspd = 0
vspd = 0
zspd = 0
fric = 4            //% per second
accel = 2           //% max speed gained per second of acceleration

canMove = true      //Can move check
moveTimer = 0
canAttack = true    //Can attack check
sneak = false
sneakMovePen = .5

staggered = false
isProne = false
dangerous = false
launcher = noone
rhythm = 0

fatigued = false
canRoll = true
canDodge = true
dodgeCost = 1
dodgeSpeed = 12
dodgeTimer = 0
recentDodge = 0
altAttackKey = false

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
autoTarget = noone;                   //This is so that if a player is using a controller, they can select an enemy

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

//Experience
xp = 0
xpToLevel = 10
xpReward = 1
xpMult = 1
combatLevel = 1
talentPoints = 0

//Vitals
life = 12
lifeVis = 12
lifeMax = 12
lifeRegen = 0.0 //per second

stam = 4
stamVis = 4
stamMax = 4    
stamRegen = 6.0   //per second
stamDelay = 0.0

stability = 1.0
stabilityMax = 1.0
stabilityRegen = 3.0
stabilityDelay = 0.0
recovery = 5.0 
staggerRecovery = 0.0

armour = 0.0
physicalResist = 0.0
magicResist = 0.0

for(i = 0; i<=13; i++){
    damageResist[i] = 0.0
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
sweetSpotBonus = false
fumble = false
perfectTimeMod = .5
perfectTimeDmgMod = 0.1
kick = 0
memory[1] = noone
memory[2] = noone

sticking = 0                        //The hand you are using to hold a sticking weapon
stuck = ds_list_create()            //The weapons sticking you that are held
stuckWithItem = ds_list_create()    //Unheld stuck items

clashing = false
clashingWith = noone

grappling = false
grappled = false
grappler = noone        //person grappling you
grappleTarg = noone     //person you are grappling

lastStand = false

interactProgress = 0

//Inventory
canInv = true
inventorySize = 5
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

ctrlFacing = 0

team = 0

#define charSetup
//Vitals
switch (type){
    case 'mook':
        lifeMax = 2+(2*vitality)
        life = lifeMax
        lifeVis = lifeMax
        
        stamMax = endurance    
        stam = stamMax
        stamVis = stamMax
        
        damageMod = 1 + (might-4)*0.1
        impactMod = 1 + (might-4)*0.1
        
        stabilityMax = 8+might
        stability = 8+might
        weight = (2+might)/6
        
        penMod = wit
        
        physicalResist = (vitality-4)*0.05
        magicResist = (magic-4)*0.05
        perfectTimeDmgMod = 0
        
        break;
    
    case 'megawarrior':
        
        lifeMax = 4+(2*vitality)
        life = lifeMax
        lifeVis = lifeMax
        
        stamMax = endurance    
        stam = stamMax
        stamVis = stamMax
        
        damageMod = 1 + (might-4)*0.1
        impactMod = 1 + (might-4)*0.1  
        
        stabilityMax = 16+(might*2)
        stability = 16+(might*2)
        weight = (2+might)/6
        
        penMod = wit
        xpMult = 1+((wit-4)*.05)
        
        physicalResist = (vitality-4)*0.05
        magicResist = (magic-4)*0.05
        
        shrineMod = 1 + (charisma-4)*0.1
        perfectTimeDmgMod = charisma*0.05
        break
    
    case 'boss':
        
        lifeMax = 10+(5*vitality)
        life = lifeMax
        lifeVis = lifeMax
        
        stamMax = endurance    
        stam = stamMax
        stamVis = stamMax
        
        damageMod = 1 + (might-4)*0.1
        impactMod = 1 + (might-4)*0.1 
        
        stabilityMax = 12+(might*1.5)
        stability = 12+(might*1.5)
        weight = (2+might)/6
    
        penMod = wit
        
        physicalResist = (vitality-4)*0.05
        magicResist = (magic-4)*0.05    
        break
    
    default:
    break
}

#define charStep
//MoveLimit
moveLimit()

//Execute Control Script
if alive = true
{
    script_execute(controlScript)
    
    //Facing
    var tS = turnSpeed;
    
    tS /= 1+charge[1]+charge[2]
    
    if max(strike[1],strike[2]) = 1 or dodgeTimer != 0 or staggered = true
    {
        tS = 0
    }
    
    if grappled = false and clashing = false and sticking = 0 and ds_list_size(stuck) = 0
    {        
        if(id == global.pc){
            if(global.pc.autoTarget == noone){
                facing = rotate(facing,point_direction(x,y,targetX,targetY),tS/global.frameRate)
            }
            else{
                facing = rotate(facing,point_direction(x,y,global.pc.autoTarget.x,global.pc.autoTarget.y),tS/global.frameRate)
            }
        }
        
        else{
            facing = rotate(facing,point_direction(x,y,targetX,targetY),tS/global.frameRate)
        }
    }
}

//Vis bars
lifeVis += (life-lifeVis)/(global.frameRate)
stamVis += (stam-stamVis)/(global.frameRate*.2)

//Movement
moveStep()
isoDepth(0)

#define charEndstep
//Animate
animEndStep(0)
animEndStep(1)
animEndStep(2)

//Animation Control (clean up and move somewhere else)
if canMove = true and alive = true
{
    if moving != 0
    {
        if sneak = false
        {
            animIndex[0] = humanoidWalk
        }
        else
        {
            animIndex[0] = humanoidSneakWalk
        }
            animSpeed[0] = max(abs(moving),1)
        if animStep[0] > 4
        {
            animStep[0] = 1
        }
    }
    else
    {
        if sneak = false
        {
            if animIndex[0] != humanoidIdle
            {
                animationStart(humanoidIdle,0)
            }
        }
        else
        {
            if animIndex[0] != humanoidSneakIdle
            {
                animationStart(humanoidSneakIdle,0)
            }
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

//Regain ability to move
if moveTimer > 0
{
    moveTimer -= 1/global.frameRate
    
    if moveTimer <= 0
    {
        canMove = true   
        dangerous = false   
    }
}

//Stability Regeneration
if stabilityDelay = 0
{
    stability = min(stabilityMax,stability+(stabilityRegen/global.frameRate))
    
    if moving = 0
    {
        stability = min(stabilityMax,stability+(stabilityRegen/global.frameRate))
    }
}
else
{
    stabilityDelay = max(0,stabilityDelay-(1/global.frameRate))
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

//Grappled
if (grappled = true)
{
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

if (sticking != 0)
{
    i = 0
    
    if sticking = 3
    {
        if instance_exists(handItem[1])
        {
            i = handItem[1]
        }
    }
    else if instance_exists(handItem[sticking])
    {
        if instance_exists(handItem[sticking])
        {
            i = handItem[sticking]
        }
    }
    
    if i != 0
    {
        ix = i.stuckIn.x
        iy = i.stuckIn.y
        
        facing = point_direction(x,y,ix,iy)
        
        if point_distance(x,y,ix,iy) > i.stuckDist+10
        {
            hspd += lengthdir_x(50/global.frameRate,facing)
            vspd += lengthdir_y(50/global.frameRate,facing)
        }
        else if point_distance(x,y,ix,iy) < i.stuckDist-5   
        {
            hspd += lengthdir_x(-50/global.frameRate,facing)
            vspd += lengthdir_y(-50/global.frameRate,facing)        
        }
    }
}

if alive = true
{
    if ds_list_size(stuck) > 0
    {
        hspd = 0
        vspd = 0
    }
}

if (clashing = true)
{
    if instance_exists(clashingWith)
    {
        facing = point_direction(x,y,clashingWith.x,clashingWith.y)
        
        if distance_to_point(clashingWith.x,clashingWith.y) > metre/2
        {
            hspd += lengthdir_x(10/global.frameRate,facing)
            vspd += lengthdir_y(10/global.frameRate,facing)
        }
        else
        {
            hspd = 0
            vspd = 0
        }
    }
    else
    {
        endClash()
    }
}

#define charDestroy
//Clear the drawing surface
surface_free(charSurf)
ds_list_destroy(sEffect)
ds_list_destroy(stuck)
ds_list_destroy(stuckWithItem)

//Remove?
with(obj_item)
{
    if stuckIn = other
    {
        stuckIn = noone
    }
}


#define charDraw
//Draw Character
if animUpdate = true
{
    script_execute(animType,1)
    animUpdate = true   //This feature might go unused
}

if instance_exists(floorID){
    //Shadow
    draw_sprite(shadowSprite,0,round(x),round(y)-floorID.wz)
    
    if player = true
    {
        draw_set_colour(c_yellow)
        draw_ellipse(round(x-5),round(y-2)-floorID.wz,round(x+3),round(y+2)-floorID.wz,false)   
    }
}


//Draw things stuck in you (behind)
if corpse = false
{
    for(i = 0; i < ds_list_size(stuckWithItem); i++)
    {
        ii = ds_list_find_value(stuckWithItem,i)
        if abs(angle_difference(point_direction(x,y,ii.x,ii.y),30)) <= 30        //Down Left
        {
            l = median(0,60,x-(ii.x-30))
            t = 0   
            w = 60-l
            h = 60  
        }
        else if abs(angle_difference(point_direction(x,y,ii.x,ii.y),90)) <= 30   //Down
        {
            l = 0
            t = 0
            w = 60
            h = median(0,60,y-(ii.y-30))   
        }
        else if abs(angle_difference(point_direction(x,y,ii.x,ii.y),150)) <= 30  //Down Right !!
        {
            l = 0
            t = 0
            w = median(0,60,x-(ii.x-30)) 
            h = 60    
        }
        else if abs(angle_difference(point_direction(x,y,ii.x,ii.y),210)) <= 30  //Up Right
        {
            l = median(0,60,x-(ii.x-30)) 
            t = 0   
            w = 60-l
            h = 60  
        }
        else if abs(angle_difference(point_direction(x,y,ii.x,ii.y),270)) <= 30  //Up !!
        {
            l = 0
            t = 0  
            w = 60
            h = median(0,60,y-(ii.y-30))   
        }
        else                                                                    //Up Left !!
        {
            l = 0
            t = 0
            w = median(0,60,x-(ii.x-30))
            h = 60
        }
        if w >= 1 and h >= 1
        {
            draw_surface_part(ii.itemSurf,l,t,w,h,round(ii.x-30)+l,round(ii.y-30-ii.z)+t) 
        }
    }
}

//Draw Surface
draw_surface_ext(charSurf,round(x-(charSurfSize*.5)),round(y-(charSurfSize*.75))-z,1,1,0,c_white,1)

//Draw things stuck in you (infront)
if corpse = false
{
    for(i = 0; i < ds_list_size(stuckWithItem); i++)
    {
        ii = ds_list_find_value(stuckWithItem,i)
        if abs(angle_difference(point_direction(x,y,ii.x,ii.y),30)) <= 30        //Down Left FIX
        {
            l = 0
            t = 0   
            w = median(0,60,x-(ii.x-30)) 
            h = 60  
        }
        else if abs(angle_difference(point_direction(x,y,ii.x,ii.y),90)) <= 30   //Down !!
        {
            l = 0
            t = median(0,60,y-(ii.y-30))
            w = 60
            h = 60-t            
        }
        else if abs(angle_difference(point_direction(x,y,ii.x,ii.y),150)) <= 30  //Down Right
        {
            l = median(0,60,x-(ii.x-30)) 
            t = 0
            w = 60-l
            h = 60    
        }
        else if abs(angle_difference(point_direction(x,y,ii.x,ii.y),210)) <= 30  //Up Right !!
        {
            l = 0
            t = 0   
            w = median(0,60,x-(ii.x-30))
            h = 60  
        }
        else if abs(angle_difference(point_direction(x,y,ii.x,ii.y),270)) <= 30  //Up !!
        {
            l = 0
            t = median(0,60,y-(ii.y-30))
            w = 60
            h = 60-t       
        }
        else                                                                    //Up Left !!
        {
            l = max(0,x-(ii.x-30)) 
            t = 0
            w = 60-l
            h = 60
        }
        if w >= 1 and h >= 1
        {
            draw_surface_part(ii.itemSurf,l,t,w,h,round(ii.x-30)+l,round(ii.y-30-ii.z)+t) 
        }
    }
}

//draw_text(x,y+10,string(moveTimer)+string(' timer'))
//draw_text(x,y+20,string(animStep[0])+string(' step'))
//draw_text(x,y+30,canMove)

/*Temp just draw random stuff
draw_set_colour(c_white)
draw_rectangle(round(x)-4,round(y)-16,round(x)+4,round(y),false)
draw_text(round(x),round(y)+20,global.frameRate)
draw_text(round(x),round(y)+30,moving*global.frameRate/metre)

#define charDrawReflection
if global.liveSurf = true
{    
    //Draw Reflection
    if surface_exists(global.reflectSurf) and surface_exists(charSurf)
    {
        surface_set_target(global.reflectSurf)
        draw_surface_ext(charSurf,round(x-(charSurfSize*.5))-global.liveSurfX1,round(y+(charSurfSize*.75))-global.liveSurfY1+z,1,-1,0,c_white,1)
        surface_reset_target()
    }
}

#define charDrawEnd
if(alive){smallHealthBar()}

#define smallHealthBar
if (player == false && global.pc.autoTarget == id)
{
    ix = round(global.camZoom*(x-view_xview))
    iy = round(global.camZoom*(y-view_yview-(metre*2)))
    
    //Life
    i = 0
    repeat(ceil(life))
    {
        draw_sprite_ext(spr_smallhealth,0,ix-10+(3*i),iy,1,1,0,c_white,life-i)
        i += 1
    }
    repeat(ceil(lifeMax-life))
    {
        draw_sprite_ext(spr_smallhealth,1,ix-10+(3*i),iy,1,1,0,c_white,1)
        i += 1
    }
    for(i = life-1; i > floor(lifeVis); i--)
    {
        draw_sprite_ext(spr_smallhealth,3,ix-10+(3*i),iy,1,1,0,c_white,i-lifeVis)
    }
    for(i = life; i < ceil(lifeVis); i++)
    {
        draw_sprite_ext(spr_smallhealth,2,ix-10+(3*i),iy,1,1,0,c_white,lifeVis-i)
    }
    
    //Stamina
    i = 0
    repeat(ceil(stamMax))
    {
        if global.pc.stam < global.pc.stamVis
        {
            draw_set_colour(c_red)
            draw_rectangle(ix-10+(5*i)+(3*floor(i*.5)),iy+4,ix-10+(5*median(0,stamVis-i,1))+(5*i)+(3*floor(i*.5)),iy+6,false)
            draw_set_colour(c_yellow)
            draw_rectangle(ix-10+(5*i)+(3*floor(i*.5)),iy+4,ix-10+(5*median(0,stam-i,1))+(5*i)+(3*floor(i*.5)),iy+6,false)
        }
        else
        {
            draw_set_colour(c_white)
            draw_rectangle(ix-10+(5*i)+(3*floor(i*.5)),iy+4,ix-10+(5*median(0,stam-i,1))+(5*i)+(3*floor(i*.5)),iy+6,false)
            draw_set_colour(c_yellow)
            draw_rectangle(ix-10+(5*i)+(3*floor(i*.5)),iy+4,ix-10+(5*median(0,stamVis-i,1))+(5*i)+(3*floor(i*.5)),iy+6,false)      
        }
        
        //Outline
        draw_sprite(spr_staminaBox,1,ix-10+(5*i)+(3*floor(i*.5)),iy+4)       
        i += 1
    }
}   

#define postCharInit
floorID = global.currLevel.floorLayout[min(floor(x/metre), global.currLevel.sizeX - 1),
                    min(floor(y/metre), global.currLevel.sizeY - 1)]
#define enterClash
//script for entering clashes, argument 0 is the person who's starting the clash with this character

var ix, iy;

if instance_exists(handItem[1])
{
    ix = (x+argument0.x)/2
    iy = (y+argument0.y)/2
    createParticle(ix,iy,handItem[1].z,15,partSpark,point_direction(x,y,ix,iy)+90)
    createParticle(ix,iy,handItem[1].z,15,partSpark,point_direction(x,y,ix,iy)-90)
}

i = instance_create(x,y,obj_text)
i.t = 'Clash!'

clashing = true 
clashingWith = argument0
facing = point_direction(x,y,argument0.x,argument0.y)
interactProgress = 0
canMove = false
moveTimer = 0
sweetSpot = false
fumble = false
hspd = lengthdir_x(8,facing)
vspd = lengthdir_y(8,facing)

animationReset(1)
animationReset(2)  

argument0.clashing = true
argument0.clashingWith = id
argument0.facing = point_direction(argument0.x,argument0.y,x,y)
argument0.interactProgress = 0
argument0.canMove = false
argument0.moveTimer = 0
argument0.sweetSpot = false
argument0.fumble = false
argument0.hspd = lengthdir_x(8,argument0.facing)
argument0.vspd = lengthdir_y(8,argument0.facing)

with(argument0)
{
    animationReset(1)
    animationReset(2)    
}

with(obj_char)
{
    if id != other and id != argument0
    {
        if point_distance(ix,iy,x,y) < 8*metre
        {
            applyStatus(id,stun,1,.1,id,false)    
        
            //Impact
            hspd += lengthdir_x(5,point_direction(ix,iy,x,y))
            vspd += lengthdir_y(5,point_direction(ix,iy,x,y))
    
            //Stagger
            canMove = false
            moveTimer += 1.5
            
            if abs(angle_difference(point_direction(ix,iy,x,y),facing)) < 90
            {
                animationStart(humanoidFlinchForward,0)
            }
            else
            {
                animationStart(humanoidFlinchBackward,0)
            }
        }
    }
}

#define endClash
if instance_exists(clashingWith)
{
    clashingWith.moveTimer += .1
    clashingWith.clashing = false 
    clashingWith.clashingWith = noone
}


moveTimer += .1
clashing = false 
clashingWith = noone