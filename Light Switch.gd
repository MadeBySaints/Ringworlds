extends Area2D
#sample script to switch torches on and off
var is_on = false

func _input(event):
    if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
        toggle_switch()

func toggle_switch():
    is_on = !is_on
    if is_on:
        # switch is now on
        $Sprite.texture = load("res://path/to/on_texture.png")
    else:
        # switch is now off
        $Sprite.texture = load("res://path/to/off_texture.png")
