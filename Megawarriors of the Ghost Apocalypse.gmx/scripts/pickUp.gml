#define pickUp
//pickUp(character)
//REMINDER this script is run by the interact flag
for(i = 0; i < argument0.inventorySize; i++)
{
    if argument0.inventory[i] = noone
    {
        if argument0.handItem[1] = noone
        {
            owner.hand = 1
            argument0.handItemSlot[1] = i
            argument0.handItem[1] = owner
        }
        
        argument0.inventory[i] = owner
        owner.owner = argument0
        instance_destroy()
        break
    }
}

#define grappleStart
owner.canMove = false

owner.grappled = true
owner.grappler = other
other.grappleTarg = owner

with(other){
switchItem(-1,2);
}
other.handItem[2] = owner

other.grappling = true

other.moveMult = 0.5
other.canRoll = false
other.canInv = false

instance_destroy()




#define grappleEnd
