#define potions


#define potionEssentials
switch(argument0)
{
    case 0:     //Initialize 
    //Core
    name = -4
    sprite_index = choose('spr_potionRed', 'spr_potionBlue')
    useScript[1] = drinkPotion
    useScript[2] = drinkPotion
    force1h = false
    
    //Item Stats
    length = 7
    holdPoint = 0
    gwPoint = 1
    weight = 0
    break
}

#define genericPotion
switch(argument0)
{
    case 0:     //Initialize 
    potionEssentials(0)
    
    //Core
    name = 'Potion'
    tooltip = "Drink potions every day."
    sprite_index = choose(spr_potionBlue, spr_potionRed)
    break
}