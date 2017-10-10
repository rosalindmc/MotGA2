#define text

#define textInitialize
t = ''
c1 = c_black
c2 = c_white
f = fnt_small
z = 0
a = 1

hud = false

#define textStep
z += metre/global.frameRate

a -= .4/global.frameRate

if a <= 0
{
    instance_destroy()
}

#define textDrawEnd
if hud = false
{
    draw_set_font(f)
    draw_set_alpha(a)
    draw_set_halign(fa_middle)
    draw_set_valign(fa_middle)
    drawText(c1,c2,x,y-z,t)
    draw_set_alpha(1)
}

#define textDrawHUD
if hud = true
{
    draw_set_font(f)
    draw_set_alpha(a)
    draw_set_halign(fa_middle)
    draw_set_valign(fa_middle)
    drawText(c1,c2,x/global.camZoom,(y-z)/global.camZoom,t)
    draw_set_alpha(1)
}