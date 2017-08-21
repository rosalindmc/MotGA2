#define text

#define textInitialize
t = ''
c1 = c_black
c2 = c_white
f = fnt_small
z = 0
a = 1

#define textStep
z += metre/global.frameRate

a -= .2/global.frameRate

if a <= 0
{
    instance_destroy()
}

#define textDrawEnd
draw_set_font(f)
draw_set_alpha(a)
draw_set_halign(fa_middle)
draw_set_valign(fa_middle)
drawText(c1,c2,x,y-z,t)
draw_set_alpha(1)