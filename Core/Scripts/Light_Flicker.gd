extends Node2D

export (bool) var isoff = false
export (int) var nPer = 16#noise period
export (float) var defEnergy = 0.8
export (float) var flux = 0.1

onready var noise = OpenSimplexNoise.new()
var value = 0.0
const MAX = 100000000

func _ready():
	randomize()
	value = randi() % MAX
	noise.period = nPer
	set_process(true)
	if isoff == true:
		turn_off()

func turn_off():
	$Light2D.set_energy(0.0)
	$AnimatedSprite.set_animation("off")
	pass

func turn_on():
	$Light2D.set_energy(defEnergy)
	$AnimatedSprite.set_animation("flicker")
	pass

func flicker():
	#var a = $Light2D.get_color()
	value += flux
	if(value > MAX):
		value = 0.0
	var alpha = ((noise.get_noise_1d(value) + 1) / 4.0) + 0.5
	$Light2D.color = Color($Light2D.color.r, $Light2D.color.g, $Light2D.color.b, alpha)

func _process(_delta):
	flicker()
