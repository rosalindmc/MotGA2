//Replace with anim type check
if (canMove && stam >= 1){
if (recentDodge = 0 || canRoll = false)
{
    animationStart(humanoid(4),0)
    dodgeTimer = .3
    moveTimer = .3
    
    hspd = lengthdir_x(dodgeSpeed,argument0)
    vspd = lengthdir_y(dodgeSpeed,argument0)
    
    spendStamina(dodgeCost,.3)
}
else
{
    facing = argument0
    
    animationStart(humanoid(5),0)
    dodgeTimer = .6
    moveTimer = .6

    hspd = lengthdir_x(dodgeSpeed,facing)
    vspd = lengthdir_y(dodgeSpeed,facing)
    
    spendStamina(dodgeCost,.6)
}

//Reset hand anims
animationReset(1)
animationReset(2)
hold[1] = 0
hold[2] = 0
charge[1] = 0
charge[2] = 0
queuedAnim[1] = -4
queuedAnim[2] = -4
strike[1] = 0
strike[2] = 0
sweetSpot = false
fumble = false

canMove = false
}
