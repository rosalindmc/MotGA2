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
    
    //Item Stats
    length = 7
    holdPoint = 0
    gwPoint = 1
    
    break
}

#define genericPotion
switch(argument0)
{
    case 0:     //Initialize 
    //Core
    name = 'Best Potion Ever'
    sprite_index = choose(spr_potionBlue, spr_potionRed)
    useScript[1] = drinkPotion
    useScript[2] = drinkPotion
    
    //Item Stats
    length = 7
    holdPoint = 0
    gwPoint = 1

    break
}