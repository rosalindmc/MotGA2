#define interactable


#define interactableInitialize
name = 'Interact'
useType = pickUp    //Script executed on interact
owner = noone       //All Interact Scripts reference an owner
                    //Interactable obj follows owner, dies if owner dies
lifeTime = -1       //Negative lives forever

#define interactableStep
if instance_exists(owner)
{
    x = owner.x
    y = owner.y

    if lifeTime > 0
    {
        lifeTime -= 1/global.frameRate
        
        if lifeTime <= 0 
        {
            instance_destroy()
        }
    }
}
else
{
    instance_destroy()
}