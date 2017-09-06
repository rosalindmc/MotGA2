#define landingPage


#define landingPageInitialize
//Screen Stuff (later handle in main menu)
window_set_cursor(cr_none)
global.gp[0] = false;
var gp_num = gamepad_get_device_count();
for (var i = 0; i < gp_num; i++;)
   {
   if gamepad_is_connected(i) global.gp[i] = true else global.gp[i] = false;
   }

instance_create(x,y,obj_viewManager)
   
//Controls
controls()

#define landingPageStep
if keyboard_check_pressed(ord('E'))
{
    room_goto_next()
    global.padOn = false
}

if gamepad_button_check(0, gp_face1) && global.gp[0] == true
{
    room_goto_next()
    global.padOn = true;
    gamepad_set_axis_deadzone(0, 0.175)
}

#define landingPageDraw
draw_set_halign(fa_middle)
draw_set_font(fnt_small)
drawText(c_black,c_white,x,y+60,'Press E to Start with mouse and keyboard')
drawText(c_black,c_white,x,y+80,'Press the A button to Start with controller')

//draw_surface_ext(application_surface,global.xOffset,global.yOffset,1,1,0,c_white,1)
