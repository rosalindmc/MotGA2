#define viewManager

#define viewManagerInitialize
screenScale()


#define viewManagerDraw


#define screenScale
//This is supposed to allow us to do good screen scaling for multiple devices later, 
//still don't know how it works

idealHeight = 270
idealWidth = 0

global.monitorW = display_get_width()
global.monitorH = display_get_height()


aspectRatio = global.monitorW/global.monitorH

idealWidth = round(idealHeight*aspectRatio)

//Pixel Perfect Scaling
if global.monitorW mod idealWidth != 0
{
    var d = round(global.monitorW/idealWidth)
    idealWidth = global.monitorW/d
}
if global.monitorH mod idealHeight != 0
{
    var d = round(global.monitorH/idealHeight)
    idealHeight = global.monitorH/d
}

if idealWidth & 1
{
    idealWidth++
}
if idealHeight & 1
{
    idealWidth++
}


for(var i = 0; i <= room_last; i++)
{
    if room_exists(i)
    {
        room_set_view(i,0,true,0,0,idealWidth,idealHeight,0,0,idealWidth,idealHeight,0,0,0,0,-1)
        room_set_view_enabled(i,true)
    }
}

surface_resize(application_surface,idealWidth,idealHeight)
display_set_gui_size(idealWidth,idealHeight)
window_set_size(idealWidth,idealHeight)


/*application_surface_draw_enable(false)
window_set_fullscreen(true)


global.viewW = 480
global.viewH = 270

global.viewScale = min(floor(global.monitorW/global.viewW),floor(global.monitorH/global.viewH))

surface_resize(application_surface,(global.viewW*global.viewScale),(global.viewH*global.viewScale))
global.xOffset=(global.monitorW-(global.viewW*global.viewScale))/2
global.yOffset=(global.monitorH-(global.viewH*global.viewScale))/2