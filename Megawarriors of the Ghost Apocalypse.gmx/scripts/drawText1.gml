//drawText(col1, col2, x, y, text)
//Run in draw step to draw text with outlines

draw_set_colour(argument0)
draw_text(argument2-1,argument3+1,argument4)
draw_text(argument2-1,argument3,argument4)
draw_text(argument2-1,argument3-1,argument4)
draw_text(argument2+1,argument3+1,argument4)
draw_text(argument2+1,argument3,argument4)
draw_text(argument2+1,argument3-1,argument4)
draw_text(argument2,argument3+1,argument4)
draw_text(argument2,argument3-1,argument4)

draw_set_colour(argument1)
draw_text(argument2,argument3,argument4)
