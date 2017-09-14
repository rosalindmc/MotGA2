#define hitCollider


#define hitColliderInitialize
danger = 2

/*scr_projectile_initialize()
colour = c_white
image_speed = 0
image_alpha = 1

alarm[0] = 1
depth = -y

audio_play_sound(snd_swing,0,false)

#define hitColliderCollisionChar
if (owner != other and other.alive = true && (other.strike[1] || other.strike[2])) && abs(angle_difference(image_angle,other.facing)) > 90
{
    hit[peopleHit] = other
    peopleHit += 1

    if owner.clashing = false && other.clashing = false
    {
        with(other)
        {
            enterClash(other.owner)
        }
    }    
}
else if (owner != other and other.alive = true && !other.strike[1] && !other.strike[2])
{
    for(i = 0; i < peopleHit; i++)
    {
        if hit[i] = other
        {
            exit
        }
    }

    hit[peopleHit] = other
    peopleHit += 1
    hitChar(other) 
}














#define hitColliderCollisionTerrain

#define hitColliderCollisionCollider

#define hitColliderDraw
draw_self()

#define hitColliderStep
