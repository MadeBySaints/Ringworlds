extends Area2D

export var emax : float = 1.0
export var emin : float = 0.2
onready var sframe = $AnimatedSprite.get_frame()
onready var cenergy = $Light2D.get_energy()
var e = Light2D.new()

enum hue {
	RED,
	ORANGE,
	YELLOW,
	GREEN,
	BLUE,
	INDIGO,
	VIOLET,
	WHITE,
	CYCLE
}

#func _process(_delta):
	
func _on_AnimatedSprite_frame_changed():
	print(sframe)
	if sframe == 0:
		print(sframe)
		$Light2D.set_energy(emin)
	if sframe == 1:
		print(sframe)
		$Light2D.set_energy(0.3)
	if sframe == 2:
		print(sframe)
		$Light2D.set_energy(0.6)
	if sframe == 3:
		print(sframe)
		$Light2D.set_energy(rand_range(0.8, emax))
	if sframe == 4:
		print(sframe)
		$Light2D.set_energy(0.6)
	if sframe == 5:
		print(sframe)
		$Light2D.set_energy(0.3)

