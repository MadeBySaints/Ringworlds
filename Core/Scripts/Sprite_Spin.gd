extends Node

onready var anim = get_node("AnimatedSprite")


func _ready():
	set_process(true)
	
func rot():
	anim.set_rotation_degrees += 1
	
func _process(_delta):
	rot()
