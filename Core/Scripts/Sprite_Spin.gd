extends Node

onready var anim = get_node("AnimatedSprite")


func _ready():
	set_process(true)
	
func rot():
	if anim.rotation_degrees < 359:
		anim.set_rotation_degrees(anim.rotation_degrees + 1)
	elif anim.rotation_degrees >= 359:
		anim.set_rotation_degrees(-360)
	
func _process(_delta):
	rot()
