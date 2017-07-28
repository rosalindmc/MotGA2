#define interact
if pointInteract != noone
{
    with(pointInteract)
    {
        script_execute(useType,other)
    }
}

#define interactSearch
var ix, iy, d, targ

ix = targetX
iy = targetY
d = metre
targ = noone

with(obj_interactable)
{
    if distance_to_point(other.x,other.y) < metre*2
    {
        if distance_to_point(ix,iy) < d
        {
            targ = id
            d = distance_to_point(ix,iy)
        }
    }
}

pointInteract = targ