#define pickUp
//pickUp(character)
//REMINDER this script is run by the interact flag
for(i = 0; i < argument0.inventorySize; i++)
{
    if argument0.inventory[i] = noone
    {
        owner.hand = 0
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

other.grappling = true

other.moveMult = 0.5
other.canRoll = false
other.canInv = false

instance_destroy()
#define openUp
if(argument0 = global.pc){
    //run a switch for which kind of crate this is
    var crateLoot = choose(choose(sword,bigSword,biggerSword,circleySword,axe,longAxe,throwyAxe,mace,warhammer,spear,pike,genericPotion));
    
    createItem(x,y, crateLoot, noone);//might change noone to argument0
    
    //make the crate look opened
    owner.imgInd = 1;
    
    //with(owner){//comment this out eventually
    instance_destroy();
    //}
}

#define shrineUse
if(argument0 = global.pc){
    //run a switch for which kind of crate this is
    
    
    check = random(3)*global.pc.shrineMod
    
    if(check > 1){
        drop = genericPotion
    }
    else if(check > 2.5){
        drop = sword
    }
    else{
        drop = specialSword
    }
    
    createItem(x,y, drop, noone);//might change noone to argument0
    
    //make the crate look opened
    owner.imgInd = 1;
    
    //with(owner){//comment this out eventually
    instance_destroy();
    //}
}
#define pilferCorpse

