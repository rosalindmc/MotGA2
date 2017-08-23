//spendStamina(cost,delay)
stam -= argument0
stamDelay = max(stamDelay,argument1+abs(min(0,stam/2)))
stam = max(stam,0)
