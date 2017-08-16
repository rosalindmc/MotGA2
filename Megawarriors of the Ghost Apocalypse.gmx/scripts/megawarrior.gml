player = true
controlScript = playerControl
type = 'megawarrior'

var i = 6

do{
    temp[5] = 0
    switch(irandom(5)){
    case 0:
        if (temp[0] < 2){
            temp[0]++
            i--
            }
    break;
    case 1:
        if (temp[1] < 2){
            temp[1]++
            i--
            }
    break
    case 2:
        if (temp[2] < 2){
            temp[2]++
            i--
            }
    break
    case 3:
        if (temp[3] < 2){
            temp[3]++
            i--
            }
    break
    case 4:
        if (temp[4] < 2){
            temp[4]++
            i--
            }
    break
    case 5:
        if (temp[5] < 2){
            temp[5]++
            i--
            }
    break
    default:
    }
}until (i <= 0)

vitality = 3 + temp[0]
might = 4 + temp[1]
wit = 3 + temp[2]
endurance = 4 + temp[3]
magic = 3 + temp[4]
charisma = 3 + temp[5]

charSetup()

