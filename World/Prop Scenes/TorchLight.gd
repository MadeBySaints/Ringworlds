extends Light2D

export var energyMaximum : float = 1.0
export var energyMinimum : float = 0.1
onready var cframe = get_parent().get_node("AnimatedSprite").get_frame()
onready var cenergy = get_parent().get_node("Light2D").get_energy()

func _process(delta):
	print(cframe)
	if cframe == 0:
		energy = energyMinimum
	elif cframe == 1:
		energy = 0.3
	elif cframe == 2:
		energy = 0.6
	elif cframe == 3:
		energy = energyMaximum
	elif cframe == 4:
		energy = 0.6
	elif cframe == 5:
		energy = 0.3
	
#func _on_AnimatedSprite_frame_changed():
#
