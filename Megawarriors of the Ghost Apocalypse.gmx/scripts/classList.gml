#define classList

#define classBarbarian
might += 1
endurance += 1
vitality += 2

//Appearance
switch(irandom(4))
{
    case 0:
    if gender = 0{
    clothingSprite = spr_cBarbarian
    skirtSprite = spr_sBarbarian}
    else{
    clothingSprite = spr_none
    skirtSprite = spr_sBarbarian}
    break
    case 1:
    if gender = 0{
    clothingSprite = spr_cBerzerk
    skirtSprite = spr_sBarbarian}
    else{
    clothingSprite = spr_cBerzerkM
    skirtSprite = spr_sBarbarian}
    break
    case 2:
    if gender = 0{
    clothingSprite = spr_cWarrior
    skirtSprite = spr_sBarbarian}
    else{
    clothingSprite = spr_cWarriorM
    skirtSprite = spr_sBarbarian}
    break
    case 3:
    clothingSprite = spr_cScavenger
    skirtSprite = spr_sBarbarian
    break
    case 4:
    if gender = 0{
    clothingSprite = spr_cFighter
    skirtSprite = spr_sFighter}
    else{
    clothingSprite = spr_none
    skirtSprite = spr_sFighter}
    break
}

createItem(x,y,choose(sword,axe,mace),id)

#define classScoundrel
wit += 1
endurance += 2
vitality += 1

//Appearance
switch(irandom(4))
{
    case 0:
    clothingSprite = spr_cScoundrel
    skirtSprite = spr_none
    break
    case 1:
    clothingSprite = spr_cBurglar
    skirtSprite = spr_none
    break
    case 2:
    clothingSprite = spr_cDandy
    skirtSprite = spr_none
    break
    case 3:
    clothingSprite = spr_cDesperado
    skirtSprite = spr_none
    break
    case 4:
    clothingSprite = spr_cAssassin
    skirtSprite = spr_none
    break    
}

createItem(x,y,choose(throwyAxe,stabbySword,knife),id)

#define classDemonHunter
magic += 1
charisma += 1
wit += 1
vitality += 1

if gender = 0{
clothingSprite = spr_cDemonHunter
skirtSprite = spr_sDemonHunter}
else{
clothingSprite = spr_cDemonHunterM
skirtSprite = spr_none}

createItem(x,y,choose(stabbySword,choppySword,knife),id)

#define classWizardHunter
magic += 1
charisma += 1
wit += 1
vitality += 1

clothingSprite = spr_cWizardHunter
skirtSprite = spr_none

createItem(x,y,choose(stabbySword,choppySword,knife),id)

#define classVampireHunter
magic += 1
charisma += 1
wit += 1
vitality += 1

clothingSprite = spr_cVampireHunter
skirtSprite = spr_none

createItem(x,y,choose(stabbySword,choppySword,knife),id)

#define classGhostHunter
magic += 1
charisma += 1
wit += 1
vitality += 1

clothingSprite = spr_cGhostHunter
skirtSprite = spr_none

createItem(x,y,choose(stabbySword,choppySword,knife),id)

#define classDeathMage
magic += 2
endurance += 1
wit += 1

clothingSprite = spr_cDeathMage
skirtSprite = spr_none

createItem(x,y,choose(sword,staff,staff),id)