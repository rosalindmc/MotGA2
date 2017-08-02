#define control


#define controlInitialize
//Essentials
randomize()
global.frameRate = 60
room_speed = global.frameRate
global.timeMult = 1
enumerators();
global.decalSurf = -1

//The spacing of the poi stuff
global.poiSpacing = 8

//Screen Stuff (later handle in main menu)
screenScale()
window_set_cursor(cr_none)
global.padOn = false;
global.gp[0] = false;
var gp_num = gamepad_get_device_count();
for (var i = 0; i < gp_num; i++;)
   {
   if gamepad_is_connected(i) global.gp[i] = true else global.gp[i] = false;
   }

//Controls
controls()

//For pause functionality, or things that need to stop running when you're paused
global.isPaused = false;

//Create pc
global.pc = instance_create(x,y,obj_char)
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
    
    room_height = sizeY*metre
    room_width = sizeX*metre
    
    createChar(500,500,darkSoldier,noone)
    
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
    
    x = floor((mouse_x+ix)/2)-shake+random(shake*2)
    y = floor((mouse_y+iy)/2)-shake+random(shake*2)
    
    kick = global.pc.kick
}

//Camera
view_xview[0] = round(median(0,x-(view_wview[0]/2),room_width-view_wview[0]))
view_yview[0] = round(median(0,y-(view_hview[0]/2),room_height-view_hview[0]))

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
if (global.timer > 30){
    global.timer -= 30
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
with(global.currLevel){
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_set_font(fnt_small)

    for (var i=0; i<sizeX; i++){
        for (var j=0; j<sizeY; j++){
        
            //if floorLayout[i,j].pathParent != noone
            //{
            //    draw_arrow(floorLayout[i,j].x*metre*2+15,floorLayout[i,j].y*metre*2+15,floorLayout[i,j].pathParent.x*metre*2+10,floorLayout[i,j].pathParent.y*metre*2+10,7)
            //}          
            if(floorLayout[i,j].isRiver == true && floorLayout[i,j].isPath == true){
                draw_sprite(spr_bridge,i+j,i*metre+10,j*metre+10)
                //drawText(c_black,c_orange,i*metre*2+10,j*metre*2+10,'B')
            }
            else if(floorLayout[i,j].isRiver == true){
                draw_sprite(spr_water,i+j,i*metre+10,j*metre+10)
                //drawText(c_black,c_blue,i*metre*2+10,j*metre*2+10,'w')
            }
            else if (floorLayout[i,j].hasPoi == true && floorLayout[i,j].weight==2){
                draw_sprite(spr_tile,i+j,i*metre+10,j*metre+10)
                //drawText(c_black,c_yellow,i*metre*2+10,j*metre*2+10,'P')//string(floorLayout[i,j].weight));
            }
            else if (floorLayout[i,j].hasPoi == true){
                draw_sprite(spr_tile,i+j,i*metre+10,j*metre+10)
                //drawText(c_black,c_green,i*metre*2+10,j*metre*2+10,'P')//string(floorLayout[i,j].weight));
            }
            else if(floorLayout[i,j].isPath == true){
                draw_sprite(spr_road,i+j,i*metre+10,j*metre+10)
                //drawText(c_black,c_red,i*metre*2+10,j*metre*2+10,'r')//floorLayout[i,j].weight);
            }
            else if(floorLayout[i,j].weight==2){
                draw_sprite(spr_tile,i+j,i*metre+10,j*metre+10)
                draw_sprite(spr_grass,i+j,i*metre+10,j*metre+10)
                //drawText(c_black,c_gray,i*metre*2+10,j*metre*2+10,'g')
            }
           
            else{
                draw_sprite(spr_tile,i+j,i*metre+10,j*metre+10)
                draw_sprite(spr_grass,i+j,i*metre+10,j*metre+10)
                draw_sprite(spr_tree,i+j,i*metre+10,j*metre+10)
                //drawText(c_black,c_white,i*metre*2+10,j*metre*2+10,string(floorLayout[i,j].weight));
            }
        }
    }
}

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


    
/*Draw Backdrops
draw_sprite(spr_backdrop,0,
view_xview[]+(view_wview[]/2)+(480*(.5-(x/room_width))),
view_yview[]+(view_hview[]/2)+(270*(.5-(y/room_height))))


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
draw_sprite(spr_reticle,0,mouse_x,mouse_y-8)
draw_sprite_ext(spr_reticle2,0,mouse_x-kick,mouse_y-8-kick,1,1,0,c_white,1)
draw_sprite_ext(spr_reticle2,0,mouse_x-kick,mouse_y-8+kick,1,1,90,c_white,1)
draw_sprite_ext(spr_reticle2,0,mouse_x+kick,mouse_y-8+kick,1,1,180,c_white,1)
draw_sprite_ext(spr_reticle2,0,mouse_x+kick,mouse_y-8-kick,1,1,270,c_white,1)

/*
draw_sprite(spr_reticle,0,mouse_x,mouse_y)
draw_sprite_ext(spr_reticle2,0,mouse_x-kick,mouse_y-kick,1,1,0,c_white,1)
draw_sprite_ext(spr_reticle2,0,mouse_x-kick,mouse_y+kick,1,1,90,c_white,1)
draw_sprite_ext(spr_reticle2,0,mouse_x+kick,mouse_y+kick,1,1,180,c_white,1)
draw_sprite_ext(spr_reticle2,0,mouse_x+kick,mouse_y-kick,1,1,270,c_white,1)

if instance_exists(global.pc)
{
    //scr_hudVital(20,20,global.pc)
    //scr_hudItem()
}

if black > 0
{
    draw_set_colour(c_black)
    draw_set_alpha(black)
    draw_rectangle(view_xview,view_yview,view_xview+view_wview,view_yview+view_hview,false)

    if global.pc.vis = false
    {
        draw_set_halign(fa_center)
        draw_set_valign(fa_center)
        draw_set_font(fnt_dmgHuge)
        drawText(c_black,c_red,view_xview+(view_wview/2),view_yview+(view_hview/2),'DEAD')
    }
}

<<<<<<< HEAD
*/


//Temp draw map for testing level gen
    
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

        //if global.pc.stam-i > 0
        //{
        //    draw_set_alpha(.2)
        //    draw_set_colour(c_black)
        //    draw_rectangle(view_xview[0]+17+(10*i)+(5*floor(i*.5)),view_yview[0]+28,view_xview[0]+17+(6*median(0,global.pc.stam-i,1))+(10*i)+(5*floor(i*.5)),view_yview[0]+32,false)
        //    draw_set_alpha(1)
        //}
        
        draw_set_colour(c_black)
        draw_rectangle(view_xview[0]+15+(10*i)+(5*floor(i*.5)),view_yview[0]+24,view_xview[0]+25+(10*i)+(5*floor(i*.5)),view_yview[0]+29,true)
        
        i += 1
    }
    
    /*
    if point_in_rectangle(mouse_x,mouse_y,0,0,sizeX*metre*2+10,sizeY*metre*2+10)
    {
        current = floorLayout[min(floor(mouse_x/(metre*2)),sizeX-1),min(floor(mouse_y/(metre*2)),sizeY-1)]
        i= 5
        while(current.pathParent != noone and i > 0)
        {
            draw_arrow(current.x*metre*2+15,current.y*metre*2+15,current.pathParent.x*metre*2+10,current.pathParent.y*metre*2+10,5)
            //current.pathParent.weight = 1       
            //current.pathParent.isPath = true
            current = current.pathParent
            i -= 1
        }
    }
    */

//draw_surface_ext(application_surface,global.xOffset,global.yOffset,1,1,0,c_white,1)


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
global.sneakKey = vk_lcontrol
global.castKey = ord('Q')
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