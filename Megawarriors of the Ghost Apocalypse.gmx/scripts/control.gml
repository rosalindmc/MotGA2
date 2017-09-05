#define control


#define controlInitialize
//Essentials
randomize()
global.frameRate = 40
room_speed = global.frameRate
global.timeMult = 1
enumerators();
global.decalSurf = -1

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
mainWorld = instance_create(0,0,obj_world)
with (mainWorld){
    worldGen()
}

//set up the threat list

global.owThreat = 0;
global.locThreat = 0;
global.locThreatTimer = 0;
global.threatTimer = false;
global.threatSpeed = 15

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
    shake -= shake*(5/global.frameRate)
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

    if(global.threatTimer && !global.isPaused){
        //global.locThreatTimer += 1/global.frameRate;
        global.locThreatTimer++;
        if((global.locThreatTimer/global.frameRate) % 15 == 0){
            threatUp();
        }
    }

//}

/*
if global.pc.vis = true and global.win = false
{
    black -= 1/global.frameRate
}
else
{
    black += .5/global.frameRate
    if keyboard_check_pressed(global.interactKey)
    {
        room_restart()
    }
    if keyboard_check_pressed(vk_escape)
    {
        game_restart()
    }
}



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
        global.liveSurfY2 = min(view_yview+view_hview,global.surfY2)
        
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
        //draw_set_font(fnt_menu)
        draw_set_halign(fa_center)
        drawText(c_black,c_white,x,y-15,name)
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

//Draw Cursor

if(!global.padOn){
    draw_sprite(spr_reticle,0,mouse_x,mouse_y-8)
    draw_sprite_ext(spr_reticle2,0,mouse_x-kick,mouse_y-8-kick,1,1,0,c_white,1)
    draw_sprite_ext(spr_reticle2,0,mouse_x-kick,mouse_y-8+kick,1,1,90,c_white,1)
    draw_sprite_ext(spr_reticle2,0,mouse_x+kick,mouse_y-8+kick,1,1,180,c_white,1)
    draw_sprite_ext(spr_reticle2,0,mouse_x+kick,mouse_y-8-kick,1,1,270,c_white,1)
}
else{
    draw_sprite(spr_reticle,0,global.pc.targetX,global.pc.targetY-8)
    draw_sprite_ext(spr_reticle2,0,global.pc.targetX-kick,global.pc.targetY-8-kick,1,1,0,c_white,1)
    draw_sprite_ext(spr_reticle2,0,global.pc.targetX-kick,global.pc.targetY-8+kick,1,1,90,c_white,1)
    draw_sprite_ext(spr_reticle2,0,global.pc.targetX-kick,global.pc.targetY-8+kick,1,1,180,c_white,1)
    draw_sprite_ext(spr_reticle2,0,global.pc.targetX-kick,global.pc.targetY-8-kick,1,1,270,c_white,1)
}
   
//HUD stuff
    //Draw Health        
    i = 0
    repeat(ceil(global.pc.life))
    {
        draw_sprite_ext(spr_health,0,view_xview[0]+15+(5*i),view_yview[0]+15,1,1,0,c_white,global.pc.life-i)
        i += 1
    }
    
    //Outline
    draw_set_colour(c_black)
    draw_rectangle(view_xview[0]+15,view_yview[0]+9,view_xview[0]+15+(5*global.pc.lifeMax),view_yview[0]+20,true)
        
    draw_set_valign(fa_middle)
    draw_set_halign(fa_left)
    draw_set_font(fnt_small)
    drawText(c_black,c_white,view_xview[0]+20,view_yview[0]+14,string(round(global.pc.life))+" / "+string(round(global.pc.lifeMax)))

    //Stamina
    i = 0
    repeat(ceil(global.pc.stamMax))
    {
        draw_set_colour(uiStaminaGreen)
        draw_rectangle(view_xview[0]+15+(10*i)+(5*floor(i*.5)),view_yview[0]+24,view_xview[0]+15+(10*median(0,global.pc.stam-i,1))+(10*i)+(5*floor(i*.5)),view_yview[0]+29,false)

        draw_set_colour(c_black)
        draw_rectangle(view_xview[0]+15+(10*i)+(5*floor(i*.5)),view_yview[0]+24,view_xview[0]+25+(10*i)+(5*floor(i*.5)),view_yview[0]+29,true)
        
        i += 1
    }
    
    //Draw Status Effects
    ii = 0
    for(i = 0; i < ds_list_size(global.pc.sEffect); i++)
    {
        if ds_list_find_value(global.pc.sEffect,i).draw = true
        {
            draw_sprite(ds_list_find_value(global.pc.sEffect,i).icon,0,view_xview[0]+15,view_yview[0]+view_hview[0]-20-(ii*20))
            ii += 1
        }
    }
    
    //drawText(c_black,c_white,view_xview[0]+view_wview[0]-15,view_yview[0]+50,fps)
if global.pc.alive = false
{
    deathAlpha += .5/global.frameRate
    
    draw_set_alpha(deathAlpha)
    draw_set_colour(c_black)
    draw_rectangle(view_xview,view_yview,view_xview+view_wview,view_yview+view_hview,false)
    draw_set_halign(fa_center)
    drawText(c_black,c_red,view_xview+(view_wview/2),view_yview+(view_hview/2),'You have died')
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
    corrode = 6,
    lightning = 7,
    radiant = 8,
    profane = 9,
    poison = 10,
    blood = 11,
    mind = 12,
    thunder = 13
};


enum podType{
    none = 0,
    minions = 1   
};

enum itemType{
    none = 0,
    knife = 1
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
global.throwKey = ord('T')
global.sneakKey = ord('C')
global.inventoryKey = vk_lshift


#define screenScale
//This is supposed to allow us to do good screen scaling for multiple devices later, 
//still don't know how it works

/*
//application_surface_draw_enable(false)
window_set_fullscreen(true)

global.monitorW = display_get_width()
global.monitorH = display_get_height()

global.viewW = 480
global.viewH = 270

global.viewScale = min(floor(global.monitorW/global.viewW),floor(global.monitorH/global.viewH))

//surface_resize(application_surface,(global.viewW*global.viewScale),(global.viewH*global.viewScale))
global.xOffset=(global.monitorW-(global.viewW*global.viewScale))/2
global.yOffset=(global.monitorH-(global.viewH*global.viewScale))/2
#define controlDestroy
surface_free(global.reflectSurf)
surface_free(global.blockSurf)
surface_free(global.maskSurf)
surface_free(global.finalReflectSurf)