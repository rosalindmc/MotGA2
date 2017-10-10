#define inventoryControl
scrollItems()

if inventoryKey = true
{
    if(!global.padOn)
    {
        var p = point_direction(view_xview+(view_wview/2),view_yview+(view_hview/2), mouse_x, mouse_y)
    }
    else
    {
        var p = point_direction(x, y, targetX, targetY)
    }
    
    hoverItem = floor(inventorySize-(((p-90-(180/inventorySize)))/(360/inventorySize)))
    if hoverItem >= inventorySize
    {
        hoverItem -= inventorySize
    }
    
    if lftclickedKey = true
    {
        switchItem(hoverItem,1)
    }
    
    if rgtclickedKey = true
    {
        switchItem(hoverItem,2)
    }
}


#define inventoryControlHUD
//While switch Items is on, divide screen radially
//highlight hoverItem,

//Black Out everything else (later use a shader)
draw_set_alpha(.5)
draw_set_colour(c_black)
draw_rectangle(0,0,global.camZoom*view_wview,global.camZoom*view_hview,false)

draw_set_font(fnt_small)
draw_set_halign(fa_middle)

//HUD Circle
if surface_exists(invCircle)
{
    surface_set_target(invCircle)
    draw_clear_alpha(c_black, 0)
    draw_set_colour(c_white)
    draw_circle(100,100,90,false)
    
    draw_set_alpha(1)
    draw_set_blend_mode(bm_subtract)
    draw_circle(100,100,15,false)
    for(i = 0; i < inventorySize; i++)
    {
        draw_line_width(100,100,100+lengthdir_x(100,(i*(360/inventorySize))),100+lengthdir_y(100,(i*(360/inventorySize))),2)
    }
    surface_reset_target()
    draw_set_blend_mode(bm_normal)
    draw_surface(invCircle,(obj_viewManager.idealWidth/2)-100,(obj_viewManager.idealHeight/2)-100)
}
else
{
    invCircle = surface_create(200,200)
}


for(i = 1; i <= inventorySize; i++)
{
    ix = (obj_viewManager.idealWidth/2)+lengthdir_x(75,(360/(inventorySize*2))+(i*(360/inventorySize))+(360/inventorySize)*round(inventorySize/4))
    iy = (obj_viewManager.idealHeight/2)+lengthdir_y(75,(360/(inventorySize*2))+(i*(360/inventorySize))+(360/inventorySize)*round(inventorySize/4))
    
    if handItemSlot[1] = inventorySize- i
    {
        draw_sprite(spr_handIcon,0,ix-4,iy+21)
    }
    
    if handItemSlot[2] = inventorySize- i
    {
        draw_sprite(spr_handIcon,1,ix+4,iy+21)
    }
}

for(i = 1; i <= inventorySize; i++)
{
    ix = (obj_viewManager.idealWidth/2)+lengthdir_x(75,(360/(inventorySize*2))+(i*(360/inventorySize))+(360/inventorySize)*round(inventorySize/4))
    iy = (obj_viewManager.idealHeight/2)+lengthdir_y(75,(360/(inventorySize*2))+(i*(360/inventorySize))+(360/inventorySize)*round(inventorySize/4))
    
    if inventory[inventorySize-i] != noone
    { 
        draw_sprite(inventory[inventorySize-i].sprite_index,0,ix,iy)
        if hoverItem = inventorySize-i
        {
            drawText(c_black,c_yellow,ix,iy+10,inventory[inventorySize-i].name)
        }
        else
        {
            drawText(c_black,c_white,ix,iy+10,inventory[inventorySize-i].name)
        }
    }
    else
    {
        if hoverItem = inventorySize-i
        {
            drawText(c_black,c_yellow,ix,iy,'Empty')
        }
        else
        {
            drawText(c_black,c_white,ix,iy,'Empty')
        }
    }
}

draw_set_halign(fa_left)
draw_set_valign(fa_top)
if instance_exists(handItem[1])
{
    ix = 20
    iy = 80
    drawText(c_black,c_white,ix,iy,handItem[1].name)
    
    if handItem[1].useScript[1] = melee
    {
        wM = 1+max(0,(handItem[1].weight-might-(greatWeapon*ceil(might*.5)))*.2)
        if greatWeapon = true
        {
            draw_text(ix,iy+12,'POW '+string_format(handItem[1].meleePow*handItem[1].gwPowMult/wM,0,1))
            draw_text(ix,iy+21,'IMP '+string_format(handItem[1].meleeImpact*handItem[1].gwImpactMult/wM,0,1))
            draw_text(ix,iy+30,'RAT '+string_format(handItem[1].meleeRate*handItem[1].gwRateMult,0,1))     
        }
        else
        {
            draw_text(ix,iy+12,'POW '+string_format(handItem[1].meleePow/wM,0,1))
            draw_text(ix,iy+21,'IMP '+string_format(handItem[1].meleeImpact/wM,0,1))
            draw_text(ix,iy+30,'RAT '+string_format(handItem[1].meleeRate/wM,0,1))
        }
        
        if might+(greatWeapon*ceil(might*.5)) < handItem[1].weight
        {
            draw_set_colour(c_red)
        }
        draw_text(ix,iy+39,'WEIGHT '+string(handItem[1].weight))
        draw_set_colour(c_white)
        draw_text_ext(ix,iy+51,handItem[1].tooltip,9,120)
    }
    else
    {
        draw_text_ext(ix,iy+12,handItem[1].tooltip,9,120)
    }
}

if instance_exists(handItem[2]) and greatWeapon = false
{
    ix = view_wview-20-120
    iy = 80
    drawText(c_black,c_white,ix,iy,handItem[2].name)
    
    if handItem[2].useScript[1] = melee
    {
        wM = 1+max(0,(handItem[2].weight-might-(greatWeapon*ceil(might*.5)))*.2)
        
        draw_text(ix,iy+12,'POW '+string_format(handItem[2].meleePow/wM,0,1))
        draw_text(ix,iy+21,'IMP '+string_format(handItem[2].meleeImpact/wM,0,1))
        draw_text(ix,iy+30,'RAT '+string_format(handItem[2].meleeRate,0,1))
        
        if might < handItem[2].weight
        {
            draw_set_colour(c_red)
        }
        draw_text(ix,iy+39,'WEIGHT '+string(handItem[2].weight))
        draw_set_colour(c_white)
        draw_text_ext(ix,iy+51,handItem[2].tooltip,9,120)
    }
    else
    {
        draw_text_ext(ix,iy+12,handItem[2].tooltip,9,120)
    }    
}
draw_set_valign(fa_middle)

#define scrollItems
if(!global.padOn){
    
    if mouse_wheel_up()
    {
        for(i = handItemSlot[1]+1; i < inventorySize+1; i++)
        {
            if i < inventorySize
            {
                if inventory[i] != noone
                {
                    switchItem(i,1)
                    break
                }
            }
            switchItem(-1,1)
        }
    }
    
    if mouse_wheel_down()
    {
        for(i = handItemSlot[2]+1; i < inventorySize+1; i++)
        {
            if i < inventorySize
            {
                if inventory[i] != noone
                {
                    switchItem(i,2)
                    break
                }
            }
            switchItem(-1,2)
        }
    }
}

else{
    if(gamepad_button_check_released(0, gp_padr))
    {
        for(i = handItemSlot[1]+1; i < inventorySize+1; i++)
        {
            if i < inventorySize
            {
                if inventory[i] != noone
                {
                    switchItem(i,1)
                    break
                }
            }
            switchItem(-1,1)
        }
    }
    
    if(gamepad_button_check_released(0, gp_padl))
    {
        for(i = handItemSlot[2]+1; i < inventorySize+1; i++)
        {
            if i < inventorySize
            {
                if inventory[i] != noone
                {
                    switchItem(i,2)
                    break
                }
            }
            switchItem(-1,2)
        }
    }
}

#define switchItem
//argument0 is which function you're using, argument1 is which limb you're using

if charge[1] = 0 and charge[2] = 0 && canInv
{
    //Clear item currently held in hand
    if handItem[argument1] != noone
    {
        if greatWeapon = false
        {
            handItem[argument1].hand = 0
        }
        else
        {
            handItem[argument1].hand = 3-argument1
        }
    }
    if argument0 != -1
    {
        //Switch to new item
        handItem[argument1] = inventory[argument0]
        
        //Assign new item to hand and hand to new item
        if handItem[argument1] != noone
        {
            handItemSlot[argument1] = argument0
            inventory[argument0].hand = argument1
        }
        else
        {
            handItemSlot[argument1] = -1
            handItem[argument1] = noone
        }
    }
    else
    {
        handItemSlot[argument1] = -1    
        handItem[argument1] = noone
    }
    
    //If both hands are on the same item wield it in two hands
    if handItemSlot[1] = handItemSlot[2] and handItem[1] != noone
    {
        greatWeapon = true
        handItem[1].hand = 1
    }
    else
    {
        greatWeapon = false
    }
}