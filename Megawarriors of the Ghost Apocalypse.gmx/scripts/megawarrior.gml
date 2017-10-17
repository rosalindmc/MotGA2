#define megawarrior
player = true
controlScript = playerControl
type = 'megawarrior'
invCircle = -4
team = 1

var i = global.statPoints

do{
    temp[5] = 0
    switch(irandom(5)){
    case 0:
        if (temp[0] < ceil(global.statPoints/3)){
            temp[0]++
            i--
            }
    break;
    case 1:
        if (temp[1] < ceil(global.statPoints/3)){
            temp[1]++
            i--
            }
    break
    case 2:
        if (temp[2] < ceil(global.statPoints/3)){
            temp[2]++
            i--
            }
    break
    case 3:
        if (temp[3] < ceil(global.statPoints/3)){
            temp[3]++
            i--
            }
    break
    case 4:
        if (temp[4] < ceil(global.statPoints/3)){
            temp[4]++
            i--
            }
    break
    case 5:
        if (temp[5] < ceil(global.statPoints/3)){
            temp[5]++
            i--
            }
    break
    default:
    break
    }
}until (i <= 0)

//Stats
vitality = 3 + temp[0]
might = 3 + temp[1]
wit = 3 + temp[2]
endurance = 3 + temp[3]
magic = 3 + temp[4]
charisma = 3 + temp[5]

script_execute(choose(raceHuman,raceLeafEl,raceFireEl,raceMetalEl,raceGhostEl,raceTiefling,raceVamp))
script_execute(choose(classBarbarian,classScoundrel,choose(classGhostHunter,classVampireHunter,classWizardHunter,classDemonHunter),classDeathMage))

charSetup()


#define randomizeStats
var i = argument0

do{
    temp[5] = 0
    switch(irandom(5)){
    case 0:
        if (temp[0] < ceil(2)){
            temp[0]++
            i--
            }
    break;
    case 1:
        if (temp[1] < ceil(2)){
            temp[1]++
            i--
            }
    break
    case 2:
        if (temp[2] < ceil(2)){
            temp[2]++
            i--
            }
    break
    case 3:
        if (temp[3] < ceil(2)){
            temp[3]++
            i--
            }
    break
    case 4:
        if (temp[4] < ceil(2)){
            temp[4]++
            i--
            }
    break
    case 5:
        if (temp[5] < ceil(global.statPoints/3)){
            temp[5]++
            i--
            }
    break
    default:
    break
    }
}until (i <= 0)

vitality += temp[0]
might += temp[1]
wit += temp[2]
endurance += temp[3]
magic += temp[4]
charisma += temp[5]
#define raceHuman
//Attributes
might += 1
endurance += 1

//Aesthetics
skinTone = choose(skinTan,skinDark,skinBrown,skinPink,skinPale)
hairStyle = spr_longHair

if skinTone = skinPink or skinTone = skinPale
{
    hairColour = choose(hairBlack,hairGinger,hairBlonde,hairBrown,hairDarkBrown)
}
else
{
    hairColour = choose(hairBlack,hairDarkBlack)    
}

#define raceLeafEl
//Attributes
vitality += 1
endurance += 1

//Aesthetics
skinTone = skinLeafGreen
hairColour = hairLeafGreen
hairStyle = spr_longHair


#define raceFireEl
//Attributes
charisma += 1
endurance += 1

//Aesthetics
skinTone = choose(skinFireRed,skinBurntRed,skinAshRed)
hairColour = choose(hairBlack,hairDarkBlack)    
hairStyle = spr_longHair


#define raceMetalEl
//Attributes
might += 1
vitality += 1

//Aesthetics
skinTone = choose(skinMetalGrey)
hairColour = choose(hairBlack,hairDarkBlack,c_ltgray,c_gray,c_white)    
hairStyle = spr_longHair


#define raceGhostEl
skinTone = choose(skinGhostBlue)
hairColour = choose(hairBlack,hairDarkBlack)
hairStyle = spr_longHair


#define raceTiefling
//Attributes
wit += 1
charisma += 1

//Aesthetics
skinTone = choose(skinDemonRed,skinDemonPale)
hairColour = choose(hairBlack,hairDarkBlack)    
hairStyle = spr_longHair



#define raceSkelemen
//Attributes
vitality += 2
endurance += 2
wit -= 1
charisma -= 1

//Aesthetics
hairStyle = spr_none


#define raceVamp
//Attributes
charisma += 2

//Aesthetics
skinTone = choose(skinVampirePale)
hairColour = choose(hairBlack,hairDarkBlack)   
hairStyle = spr_longHair 

#define raceFish
//Attributes
wit += 2
endurance += 1
might -= 1

//Aesthetics
skinTone = choose(skinFishBlue,skinFishGreen,skinFishRed,skinFishYellow)
hairStyle = spr_none

#define raceGhost
//Attributes
magic += 1
wit += 1
endurance += 2
vitality -= 1
might -= 1

//Aesthetics
skinTone = c_white
hairStyle = spr_none

#define raceRecoon
skinTone = c_white
hairStyle = spr_none

#define raceRobot
skinTone = c_white
hairStyle = spr_none