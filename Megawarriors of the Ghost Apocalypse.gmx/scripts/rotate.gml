//scr_rotate(old,direction,turnspeed)
ia = angle_difference(argument0,argument1)

if ia > argument2
{
    return(argument0-argument2)
}
else if ia < -argument2
{
    return(argument0+argument2)
}
else
{
    return(argument1)
}
