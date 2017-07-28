//spendStamina(cost,delay)
stam -= argument0
stamDelay = max(stamDelay,argument1+abs(min(0,stam)))
stam = max(stam,0)
