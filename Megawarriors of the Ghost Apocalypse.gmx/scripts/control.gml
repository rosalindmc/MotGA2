#define control


#define controlInitialize
//Essentials
randomize()
global.frameRate = 40
room_speed = global.frameRate
global.timeMult = 1
enumerators();
global.decalSurf = -1
global.camZoom = 1
global.camZoomTo = 1
global.xpTimer = 0

//Shaders and Surfaces
uTime = shader_get_uniform(shd_ripple,"Time")
shader_set_uniform_f(uTime,current_time/1000)
global.reflectSurf = -4
global.finalReflectSurf = -4
global.blockSurf = -4
global.maskSurf = -4
deathAlpha = 0

//The spacing of the poi stuff
global.poiSpacing = 8

//For pause functionality, or things that need to stop running when you're paused
global.isPaused = false;

//Create pc
global.statPoints = 6
global.pc = createChar(x,y,megawarrior,noone)
global.safezone = 10
//later add import stats script

global.timer = 0



//temp node



//Camera
shake = 0
kick = 0

//global.currNode = noone
global.numNodes = 9
global.mainWorld = instance_create(0,0,obj_world)
with (global.mainWorld){
    worldGen()
}

//set up the threat list

global.owThreat = 0;
global.locThreat = 0;
global.threatTimer = 0;
global.threatSpeed = .02

global.currLevel = instance_create(0,0,obj_level)

with (global.currLevel){

    levelInitialize()
    
}


/*
x = room_width/2
y = room_height/2

window_set_cursor(cr_none)
shake = 0
kick = 0

global.frameRate = 60

room_speed = global.frameRate
randomize()

#define controlStep
//Temp Restart Button
if keyboard_check_pressed(ord('R'))
{
    game_restart()
}

if keyboard_check_pressed(ord('I')){
    if(!global.padOn && global.gp[0] == true){
        global.padOn = true;
        gamepad_set_axis_deadzone(0, 0.175);
    }
    else{
        global.padOn = false;
    }
}

//Xp Alpha
global.xpTimer = max(0,global.xpTimer-(1/global.frameRate))

//Zoom Control
if global.pc.clashing = true
{
    global.camZoomTo = min(2+global.pc.interactProgress,4)
}
else if global.pc.grappling = true or global.pc.grappled = true
{
    global.camZoomTo = 4
}
else if global.pc.lastStand = true
{
    global.camZoomTo = 2
}
else
{
    global.camZoomTo = 1
}

if global.camZoom > global.camZoomTo
{
    global.camZoom = max(global.camZoomTo,global.camZoom-(4/global.frameRate))
}
if global.camZoom < global.camZoomTo
{
    global.camZoom = min(global.camZoomTo,global.camZoom+(4/global.frameRate))
}
view_wview = obj_viewManager.idealWidth/global.camZoom
view_hview = obj_viewManager.idealHeight/global.camZoom

//Adjust Camera Position
if instance_exists(global.pc)
{
    ix = round((global.pc.x))
    iy = round((global.pc.y))
    
    x = floor((global.pc.targetX+(ix*3))/4)-shake+random(shake*2)
    y = floor((global.pc.targetY+(iy*3))/4)-shake+random(shake*2)
    
    kick = global.pc.kick
}

//Camera
view_xview[0] = round(median(8,x-(view_wview[0]/2),room_width-view_wview[0]-8))
view_yview[0] = round(median(8,y-(view_hview[0]/2),room_height-view_hview[0]-8))

//Reduce Shake
if shake > .1
{
    shake = max(shake-(shake*(5/global.frameRate)),0)
}
else
{
    shake = 0
}


//Global Timer
global.timer += 1/global.frameRate
if (global.timer > 600){
    global.timer -= 600
}

//Threat Timer

//if(global.currLevel != noone){
    if(!global.isPaused)
    {
        global.threatTimer += global.threatSpeed/global.frameRate;
        if global.threatTimer >= 1
        {
            threatUp();
            global.threatTimer -= 1
        }
    }

//}



#define controlDrawbegin
//Decals
if surface_exists(global.decalSurf )
{
    draw_surface(global.decalSurf , 0, 0)
}
else
{
    global.decalSurf  = surface_create(room_width, room_height)
    surface_set_target(global.decalSurf )
    draw_clear_alpha(c_black, 0)
    surface_reset_target()
}

//Water Reflections
if global.surfX2 != 0
{
    if global.timer%.1 <= 1/global.frameRate
    {
        //Calculate the new liveSurfX and liveSurfY
        global.liveSurfX1 = max(view_xview,global.surfX1)
        global.liveSurfX2 = min(view_xview+view_wview,global.surfX2)
        global.liveSurfY1 = max(view_yview,global.surfY1)   
        global.liveSurfY2 = min(view_yview+view_hview+metre,global.surfY2)
        
        /* OPTIMIZE REFLECTIONS EVENTUALLY
        global.liveSurfX1 = view_xview+view_wview
        global.liveSurfX2 = view_xview
        global.liveSurfY1 = view_yview+view_hview
        global.liveSurfY2 = view_yview
        
        for(i = 0; i < global.currLevel.numWaterTiles; i++)
        {   
            if global.currLevel.waterTiles[i].gridX >= floor((view_xview-(5*metre))/metre) and global.currLevel.waterTiles[i].gridX <= ceil((view_xview+view_wview+(5*metre))/metre)
            and global.currLevel.waterTiles[i].gridY >= floor((view_yview-(5*metre))/metre) and global.currLevel.waterTiles[i].gridY <= ceil((view_yview+view_hview+(5*metre))/metre)
            {
                global.liveSurfX1 = min(view_xview,global.currLevel.waterTiles[i].x-8,global.liveSurfX1)
                global.liveSurfX2 = max(view_xview+view_wview,global.currLevel.waterTiles[i].x+8,global.liveSurfX2)
                global.liveSurfY1 = min(view_yview,global.currLevel.waterTiles[i].y-8,global.liveSurfY1)
                global.liveSurfY2 = max(view_yview+view_hview,global.currLevel.waterTiles[i].y+8,global.liveSurfY2)
            }
        }
        */
    
        if global.liveSurfX1 < global.liveSurfX2 and global.liveSurfY1 < global.liveSurfY2
        {
            global.liveSurf = true
        }
        else
        {
            global.liveSurf = false
        }
    }
    
    if global.liveSurf = true
    {
        //Reflect Surface
        if surface_exists(global.reflectSurf)
        {
                surface_free(global.reflectSurf)
        }
        global.reflectSurf = surface_create(global.liveSurfX2-global.liveSurfX1,global.liveSurfY2-global.liveSurfY1)
        surface_set_target(global.reflectSurf)
            
        //Draw sky
        draw_clear_alpha(make_colour_rgb(150,240,255),0)
        draw_sprite(spr_sun,0,view_xview+(view_wview/2)-global.liveSurfX1,view_yview+(view_hview*.75)-global.liveSurfY1)
        draw_sprite_tiled(spr_clouds,0,view_xview+current_time/25+(view_wview/2)-global.liveSurfX1,view_yview+(view_hview/2)-global.liveSurfY1)
        surface_reset_target()
        
        //Block Surface
        if surface_exists(global.blockSurf)
        {
            surface_free(global.blockSurf)
        }
        global.blockSurf = surface_create(global.liveSurfX2-global.liveSurfX1,global.liveSurfY2-global.liveSurfY1)
        surface_set_target(global.blockSurf)
        draw_clear_alpha(c_white,0)
        surface_reset_target()
        
        //Mask Surface
        //The Mask Surface is baked and needs to only ever be drawn here.  Objects that seldom ever move should draw to mask surf
        if !surface_exists(global.maskSurf)
        {
            global.maskSurf = surface_create(global.surfX2-global.surfX1,global.surfY2-global.surfY1)
            
            surface_set_target(global.maskSurf)
            draw_clear_alpha(c_white,1)
            with(obj_tile)
            {
                if isWater = true
                {
                    draw_set_blend_mode(bm_subtract)
                    draw_sprite(spr_tile,0,x-global.surfX1,y-wz-global.surfY1)
                    if wSBorder = true
                    {
                        draw_set_blend_mode(bm_add)
                        draw_sprite(spr_tile,0,x-global.surfX1,y+metre-global.surfY1)
                    }
                }
            }
            draw_set_blend_mode(bm_add)
            with(obj_terrain)
            {
                draw_sprite_ext(sprite_index,image_index,x-global.surfX1,y-global.surfY1,image_xscale,image_yscale,image_angle,c_white,image_alpha)
            } 
            surface_reset_target()
            draw_set_blend_mode(bm_normal)
        }
    }
}



    
/*Draw Backdrops
draw_sprite(spr_backdrop,0,
view_xview[]+(view_wview[]/2)+(480*(.5-(x/room_width))),
view_yview[]+(view_hview[]/2)+(270*(.5-(y/room_height))))


#define controlDraw
//Combine the surfaces    
if global.liveSurf = true
{
    if surface_exists(global.reflectSurf)
    {
        surface_free(global.finalReflectSurf)
        global.finalReflectSurf = surface_create(global.liveSurfX2-global.liveSurfX1,global.liveSurfY2-global.liveSurfY1)     
        
        shader_set(shd_ripple)
        shader_set_uniform_f(uTime,((current_time/1000)-(global.liveSurfY1/6.2831))) 
        surface_set_target(global.finalReflectSurf)
        draw_clear_alpha(make_colour_rgb(150,240,255),0)
        draw_surface(global.reflectSurf,0,0)
        shader_reset()
        
        draw_set_colour_write_enable(false,false,false,true)
        draw_set_blend_mode(bm_subtract)
        if surface_exists(global.maskSurf)
        {
            draw_surface(global.maskSurf,global.surfX1-global.liveSurfX1,global.surfY1-global.liveSurfY1)
        }
        
        if surface_exists(global.blockSurf)
        {
            draw_surface(global.blockSurf,0,0)   
        }
        draw_set_blend_mode(bm_normal)
        draw_set_colour_write_enable(true,true,true,true)
        
        surface_reset_target()

        draw_set_alpha(.5)
        draw_surface(global.finalReflectSurf,global.liveSurfX1,global.liveSurfY1)
        draw_set_alpha(1)
        
        //draw_rectangle(global.liveSurfX1,global.liveSurfY1,global.liveSurfX2,global.liveSurfY2,true)
    }
}

#define controlDrawHUD
//Draw Interact Tooltip
if global.pc.pointInteract != noone
{    
    with(global.pc.pointInteract)
    {
        draw_set_halign(fa_center)
        drawText(c_black,c_white,global.camZoom*(x-view_xview),global.camZoom*(y-15-view_yview),name)
    }
}

//Draw Inventory
if global.pc.inventoryKey = true
{
    with(global.pc)
    {
        inventoryControlHUD()
    }
}

//Draw Relevent Progress Bar
if global.pc.lastStand = true
{
    ix = round(global.camZoom*(view_wview*.5))
    iy = round(global.camZoom*(view_hview*.85))
    draw_set_colour(c_red)
    draw_rectangle(ix-25,iy,ix-25+(50*(global.pc.life/global.pc.lifeMax)),5+iy,false)    
    draw_sprite(spr_bigBox,0,ix-25,iy)
}

if global.pc.clashing = true
{
    ix = round(global.camZoom*(view_wview*.5))
    iy = round(global.camZoom*(view_hview*.75))
    draw_set_colour(c_white)
    draw_rectangle(ix-25,iy,ix+(24*clamp(-1,1,global.pc.interactProgress-global.pc.clashingWith.interactProgress)),5+iy,false)    
    draw_set_colour(c_red)
    draw_rectangle(ix+24,iy,ix+(24*clamp(-1,1,global.pc.interactProgress-global.pc.clashingWith.interactProgress)),5+iy,false)
    draw_sprite(spr_bigBox,0,ix-25,iy)
}

//Draw Cursor
if(!global.padOn){
    draw_sprite(spr_reticle,0,global.camZoom*(mouse_x-view_xview),global.camZoom*(mouse_y-8-view_yview))
    draw_sprite_ext(spr_reticle2,0,global.camZoom*(mouse_x-kick-view_xview),global.camZoom*(mouse_y-8-kick-view_yview),1,1,0,c_white,1)
    draw_sprite_ext(spr_reticle2,0,global.camZoom*(mouse_x-kick-view_xview),global.camZoom*(mouse_y-8+kick-view_yview),1,1,90,c_white,1)
    draw_sprite_ext(spr_reticle2,0,global.camZoom*(mouse_x+kick-view_xview),global.camZoom*(mouse_y-8+kick-view_yview),1,1,180,c_white,1)
    draw_sprite_ext(spr_reticle2,0,global.camZoom*(mouse_x+kick-view_xview),global.camZoom*(mouse_y-8-kick-view_yview),1,1,270,c_white,1)
}
else{
    draw_sprite(spr_reticle,0,global.camZoom*(global.pc.targetX-view_xview),global.camZoom*(global.pc.targetY-8-view_yview))
    draw_sprite_ext(spr_reticle2,0,global.camZoom*(global.pc.targetX-kick-view_xview),global.camZoom*(global.pc.targetY-8-kick),1,1,0,c_white,1)
    draw_sprite_ext(spr_reticle2,0,global.camZoom*(global.pc.targetX-kick-view_xview),global.camZoom*(global.pc.targetY-8+kick),1,1,90,c_white,1)
    draw_sprite_ext(spr_reticle2,0,global.camZoom*(global.pc.targetX-kick-view_xview),global.camZoom*(global.pc.targetY-8+kick),1,1,180,c_white,1)
    draw_sprite_ext(spr_reticle2,0,global.camZoom*(global.pc.targetX-kick-view_xview),global.camZoom*(global.pc.targetY-8-kick),1,1,270,c_white,1)
}
   
//HUD stuff
    //Draw Health        
    i = 0
    repeat(ceil(global.pc.life))
    {
        draw_sprite_ext(spr_health,0,15+(5*i),15,1,1,0,c_white,global.pc.life-i)
        i += 1
    }
    repeat(ceil(global.pc.lifeMax-global.pc.life))
    {
        draw_sprite_ext(spr_health,1,15+(5*i),15,1,1,0,c_white,1)
        i += 1
    }  
    for(i = global.pc.life; i > ceil(global.pc.lifeVis); i--)
    {
        draw_sprite_ext(spr_health,3,15+(5*i),15,1,1,0,c_white,global.pc.life-global.pc.lifeVis)
    }
    for(i = global.pc.life; i < floor(global.pc.lifeVis); i++)
    {
        draw_sprite_ext(spr_health,2,15+(5*i),15,1,1,0,c_white,global.pc.lifeVis-global.pc.lifeVis)
    }
            
    draw_set_valign(fa_middle)
    draw_set_halign(fa_left)
    draw_set_font(fnt_small)
    drawText(c_black,c_white,20,14,string(round(global.pc.life))+" / "+string(round(global.pc.lifeMax)))

    //Stamina 
    i = 0
    repeat(ceil(global.pc.stamMax))
    {
        if global.pc.stam < global.pc.stamVis
        {
            draw_set_colour(c_red)
            draw_rectangle(15+(10*i)+(5*floor(i*.5)),24,15+(10*median(0,global.pc.stamVis-i,1))+(10*i)+(5*floor(i*.5)),29,false)
            draw_set_colour(c_yellow)
            draw_rectangle(15+(10*i)+(5*floor(i*.5)),24,15+(10*median(0,global.pc.stam-i,1))+(10*i)+(5*floor(i*.5)),29,false)
        }
        else
        {
            draw_set_colour(c_white)
            draw_rectangle(15+(10*i)+(5*floor(i*.5)),24,15+(10*median(0,global.pc.stam-i,1))+(10*i)+(5*floor(i*.5)),29,false)
            draw_set_colour(c_yellow)
            draw_rectangle(15+(10*i)+(5*floor(i*.5)),24,15+(10*median(0,global.pc.stamVis-i,1))+(10*i)+(5*floor(i*.5)),29,false)        
        }
        
        draw_sprite(spr_staminaBox,0,15+(10*i)+(5*floor(i*.5)),24)
        
        i += 1
    }
    
if global.camZoom = 1
{
    if global.xpTimer != 0
    {
        //Experience
        draw_set_alpha(global.xpTimer)
        draw_set_colour(uiDarkGray)
        draw_rectangle(global.camZoom*35,global.camZoom*(view_hview-23),global.camZoom*84,global.camZoom*(view_hview-21),false)
        draw_set_colour(uiXpPurple)  
        draw_rectangle(global.camZoom*35,global.camZoom*(view_hview-23),global.camZoom*(35+(49*(global.pc.xp/global.pc.xpToLevel))),global.camZoom*(view_hview-21),false)  
        draw_sprite(spr_xpBox,0,global.camZoom*35,global.camZoom*(view_hview-23))
        draw_set_alpha(1)
    }
    
    //Threat
    draw_set_colour(uiDarkGray)
    draw_rectangle(view_wview-190,15,view_wview-30,20,false)
    draw_set_colour(c_red)  
    draw_rectangle(view_wview-190,15,view_wview-190+min(160,(20*global.locThreat)+(20*global.threatTimer)),20,false)
    
    for(i = 0; i < 8; i++)
    {
        draw_sprite(spr_threatBar,0,view_wview-190+(i*20),15)
    }
    
    for(i = 0; i < 4; i++)
    {    
        if global.locThreat/2 >= i+1
        {
            draw_sprite(spr_threatSkull,1,view_wview-190+(i*40)+40,17)
        }
        else
        {
            draw_sprite(spr_threatSkull,0,view_wview-190+(i*40)+40,17)
        }
    }
    
    //Draw Status Effects
    ii = 0
    for(i = 0; i < ds_list_size(global.pc.sEffect); i++)
    {
        if ds_list_find_value(global.pc.sEffect,i).draw = true
        {
            draw_sprite(ds_list_find_value(global.pc.sEffect,i).icon,0,15,global.camZoom*(view_hview[0]-20-(ii*20)))
            ii += 1
        }
    }
}

if global.pc.alive = false
{
    deathAlpha += .5/global.frameRate
    
    draw_set_alpha(deathAlpha)
    draw_set_colour(c_black)
    draw_rectangle(0,0,global.camZoom*view_wview,global.camZoom*view_hview,false)
    draw_set_halign(fa_center)
    drawText(c_black,c_red,global.camZoom*(view_wview/2),global.camZoom*(view_hview/2),'You have died')
    draw_set_alpha(1)
}

#define enumerators




enum biomeGen{
    none = 0,
    normalForest = 1
    /*mountain = 2,
    plain = 3,
    swamp = 4,
    cave = 10,
    temple = 11,
    dungeon = 12*/
};

enum biomeQualifiers{
    none = 0,
    outlaw = 1,           //bandits and stuff
    villainous = 2        //more minions of evil
    /*metal = 2,
    leaf = 3,
    fire = 4,
    chaos = 10,
    law = 11,
    good = 12,
    evil = 13,
    debrah = 14*/
};

enum levelSize{
    small = 40,
    medium = 60,
    large = 80
};

enum poiType{
    none = 0,
    shrine = 1,
    site = 2,
    port = 3,
    miniboss = 10,
    specItem = 11,
    specChar = 12,
    dungeonPort = 13
    //Doors and Keysssss?
};

enum dmgType{
    normal = 0,
    rend = 1,
    impact = 2,
    pierce = 3,   
    fire = 4,
    cold = 5,
    corrode = 10,
    lightning = 11,
    radiant = 8,
    profane = 9,
    poison = 5,
    blood = 6,
    mind = 12,
    thunder = 13
};


enum podType{
    none = 0,
    minions = 1   
};

enum itemType{
    none = 0
};

enum bossType{
    none = 0,
    champion = 1
}



#define controls
global.upKey = ord('W')
global.leftKey = ord('A')
global.downKey = ord('S')
global.rightKey = ord('D')

global.interactKey = ord('E')
global.dodgeKey = vk_space
global.castKey = ord('Q')
global.reloadKey = ord('R')
global.altAttackKey = vk_lshift
global.throwKey = ord('F')
global.sneakKey = ord('C')
global.inventoryKey = vk_tab


#define controlDestroy
surface_free(global.reflectSurf)
surface_free(global.blockSurf)
surface_free(global.maskSurf)
surface_free(global.finalReflectSurf)