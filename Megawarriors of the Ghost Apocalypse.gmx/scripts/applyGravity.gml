/*Apply Gravity
grid = collision_point(x,y,obj_grid,false,false)

if instance_exists(grid)
{
    if h-zspd > grid.h
    {
        grounded = false
        zspd += (oneG*metre)/global.frameRate
        h -= zspd
    }
    else
    {
        grounded = true
        h = grid.h
        
        if abs(zspd) > (oneG*metre)/global.frameRate
        {
        zspd *= .5
        }
        else
        {
        zspd = 0
        }
    }
}
else
{
    instance_destroy()
}

