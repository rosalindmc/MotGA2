#define playerControl
//Move Control
if(!global.padOn){
    upKey = keyboard_check(global.upKey)
    leftKey = keyboard_check(global.leftKey)
    downKey = keyboard_check(global.downKey)
    rightKey = keyboard_check(global.rightKey)
    
    lftclickKey = mouse_check_button(mb_left)
    rgtclickKey = mouse_check_button(mb_right)
    lftclickedKey = mouse_check_button_pressed(mb_left)
    rgtclickedKey = mouse_check_button_pressed(mb_right)
    lftreleaseKey = mouse_check_button_released(mb_left)
    rgtreleaseKey = mouse_check_button_released(mb_right)
    interactKey = keyboard_check_pressed(global.interactKey)
    castKey = keyboard_check_pressed(global.castKey)
    castReleasedKey = keyboard_check_released(global.castKey)
    dodgeKey = keyboard_check_released(global.dodgeKey)
    reloadKey = keyboard_check_pressed(global.reloadKey)
    throwKey = keyboard_check(global.throwKey)
    sneakKey = keyboard_check_pressed(global.sneakKey)
    inventoryKey = keyboard_check(global.inventoryKey)
}

else{

    if(gamepad_axis_value(0, gp_axislv) < 0){
        upKey = 1;
    }
    else{
        upKey = 0;
    }
    if(gamepad_axis_value(0, gp_axislv) > 0){
        downKey = 1;
    }
    else{
        downKey = 0;
    }
    if(gamepad_axis_value(0, gp_axislh) > 0){
        rightKey = 1;
    }
    else{
        rightKey = 0;
    }
    if(gamepad_axis_value(0, gp_axislh) < 0){
        leftKey = 1;
    }
    else{
        leftKey = 0;
    }
    /*
    rightKey = gamepad_button_check(0, gp_padr);
    */
    
    //right and left click - bumpers by default - rebindable
    lftclickKey = gamepad_button_check(0, gp_shoulderr)
    rgtclickKey = gamepad_button_check(0, gp_shoulderl)
    lftclickedKey = gamepad_button_check_pressed(0, gp_shoulderr)
    rgtclickedKey = gamepad_button_check_pressed(0, gp_shoulderl)
    lftreleaseKey = gamepad_button_check_released(0, gp_shoulderr)
    rgtreleaseKey = gamepad_button_check_released(0, gp_shoulderl)
    
    //face... 1 = A, 2 = B, 3 = X, 4 = Y
    interactKey = gamepad_button_check_released(0, gp_face3);
    castKey = gamepad_button_check(0, gp_face2);
    castReleasedKey = gamepad_button_check_released(0, gp_face2);
    dodgeKey = gamepad_button_check(0, gp_face1);
    reloadKey = keyboard_check_pressed(global.reloadKey)
    //throw has to be seperated for each hand
    throwKey = gamepad_button_check(0, gp_shoulderlb)
    sneakKey = gamepad_button_check(0, gp_stickl);
    inventoryKey = gamepad_button_check(0, gp_face4);
}

//Movement
moveControl()

//Switch Items
inventoryControl()

//Dodge Control
if (dodgeKey = true and canMove = true and stam >= 1 and (moving != 0))
{
    dodgeRoll(point_direction(0,0,hspd,vspd))  
}

if canAttack = true and inventoryKey = false
{
    //Interact Control
    interactSearch()
    
    if interactKey = true
    {
        interact()  
    }
    
    //Use Item
    if lftclickedKey = true
    {
        useItem(1,0)  
    }
    if rgtclickedKey = true
    {
        useItem(2,0)  
    }
}

//Release Use Item
if lftreleaseKey = true
{
    useItem(1,1)  
}
if rgtreleaseKey = true
{
    useItem(2,1)  
}

//Targeting
if(!global.padOn){
    targetX = mouse_x
    targetY = mouse_y
    if(autoTarget == noone){
        selectAutoTarget();
    }
    else{
        if(point_distance(autoTarget.x, autoTarget.y, mouse_x, mouse_y) > 10*metre){
            autoTarget = noone;
        }
        else if(point_distance(autoTarget.x, autoTarget.y, mouse_x, mouse_y) > 0.5*metre){
            selectAutoTarget();
        }
    }
}
else{
    
    //check if there's an autolocked target
    if(autoTarget == noone){
        if hspd != 0 or vspd != 0
        {
        ctrlFacing = point_direction(0,0,hspd,vspd)
        }
    
        targetX = x + (gamepad_axis_value(0, gp_axisrh) * 3 * metre) + lengthdir_x(metre*abs(moving)/10, ctrlFacing);
        targetY = y + (gamepad_axis_value(0, gp_axisrv) * 3 * metre) + lengthdir_y(metre*abs(moving)/10, ctrlFacing);
        //R3 selects an autolock target
        if(gamepad_button_check(0, gp_shoulderrb)){
            selectAutoTarget();
        }
    }
    else{
    
        if (gamepad_axis_value(0, gp_axisrh)>0.5 || gamepad_axis_value(0, gp_axisrh) < -0.5){
            targetX = x + (gamepad_axis_value(0, gp_axisrh) * 3 * metre);
            targetY = y + (gamepad_axis_value(0, gp_axisrv) * 3 * metre);
            
            if(gamepad_button_check(0, gp_shoulderrb)){
                selectAutoTarget();
            }
        }
        else if (gamepad_axis_value(0, gp_axisrv)>0.5 || gamepad_axis_value(0, gp_axisrv) < -0.5){
            targetX = x + (gamepad_axis_value(0, gp_axisrh) * 3 * metre);
            targetY = y + (gamepad_axis_value(0, gp_axisrv) * 3 * metre);
            
            if(gamepad_button_check(0, gp_shoulderrb)){
                selectAutoTarget();
            }
        }
        else{
            targetX = autoTarget.x;
            targetY = autoTarget.y;
        }
        
        //check how far away the target is
        if(point_distance(autoTarget.x, autoTarget.y, x, y) > 10 * metre){
            autoTarget = noone;
        }
    }
}



#define selectAutoTarget
var closest = 3 * metre;

with(obj_char){
if alive = true{
    if(!player && !grappled){
        var dist = point_distance(other.targetX, other.targetY, x, y);
        if (dist < closest){
            closest = dist;
            other.autoTarget = id;
        }
    }
}
}