#define switchItems
//While switch Items is on, divide screen radially
//Set a hoverItem variable to current section
//Left click to assign right hand to current section
//Right click to assign left hand to current section

//Will need corresponding code Draw HUD, set a variable to do this

#define switchItemsHUD
//While switch Items is on, divide screen radially
//highlight hoverItem,

#define scrollItems
//Mouse Wheel up to make right hand switch to next item, cycling
//Mouse Wheel down to cycle left hand

/*
invSelect += argument0

if invSelect > array_length_1d(invSlot)-2
{
    invSelect = 1 
}
if invSelect < 1
{
    invSelect = array_length_1d(invSlot)-1
}


repeat(array_length_1d(invSlot)-2)
{
    if !instance_exists(invSlot[invSelect])
    {
        invSelect += argument0
        
        if invSelect > array_length_1d(invSlot)-2
        {
            invSelect = 1 
        }
        if invSelect < 1
        {
            invSelect = array_length_1d(invSlot)-1
        }
    }   
}   
        
if instance_exists(invSlot[invSelect])
{
    anim[1] = invSlot[invSelect].anim[0]
}
