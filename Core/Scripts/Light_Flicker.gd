extends Light2D

export (bool) var isoff = false
export (int) var nPer = 16
export (float) var defEnergy = 0.8
export (float) var flux = 0.5

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
	set_energy(0.0)
	pass

func turn_on():
	set_energy(defEnergy)
	pass

func flicker():
	var a = get_color()
	value += flux
	if(value > MAX):
		value = 0.0
	var alpha = ((noise.get_noise_1d(value) + 1) / 4.0) + 0.5
	self.color = Color(color.r, color.g, color.b, alpha)

func _process(_delta):
	flicker()
