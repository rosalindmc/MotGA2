var i = 0

if abs(angle_difference(facing,0)) < 85
{
    hFacing = 1    
}
else if abs(angle_difference(facing,180)) < 85
{
    hFacing = -1
}
if abs(angle_difference(facing,90)) < 85
{
    vFacing = 1
}
else if abs(angle_difference(facing,270)) < 85
{
    vFacing = 0
}

//Twist
if vFacing = 1 and hFacing = 1
{
i = 1
}
else if vFacing = 1 and hFacing = -1
{
i = 2
}
else if vFacing = 0 and hFacing = -1
{
i = 3
}
else if vFacing = 0 and hFacing = 1
{
i = 4
}

i += argument0
hipsHFacing = hFacing
hipsVFacing = vFacing
    
switch(i)
{
case 0:
    bodyVFacing = 0
    bodyHFacing = 1
    shldrSwap = 1
break
case 1:
    bodyVFacing = 1
    bodyHFacing = 1
    shldrSwap = 0
break
case 2:
    bodyVFacing = 1
    bodyHFacing = -1
    shldrSwap = 1
break
case 3:
    bodyVFacing = 0
    bodyHFacing = -1
    shldrSwap = 0
break
case 4:
    bodyVFacing = 0
    bodyHFacing = 1
    shldrSwap = 1
break
case 5:
    bodyVFacing = 1
    bodyHFacing = 1
    shldrSwap = 0
break
}
