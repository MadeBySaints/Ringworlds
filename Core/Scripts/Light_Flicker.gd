extends Light2D

onready var sprite = get_parent().get_node("AnimatedSprite")
onready var noise = OpenSimplexNoise.new()
var value = 0.0
const MAX = 100000000


func _ready():
	randomize()
	value = randi() % MAX
	noise.period = 16
	set_process(true)



func turn_off():
	set_energy(0.0)
	sprite.set_visible(false)
	pass

func turn_on():
	set_energy(0.8)
	sprite.set_visible(true)
	pass


func flicker():
	var a = get_color()
	value += 0.5
	if(value > MAX):
		value = 0.0
	var alpha = ((noise.get_noise_1d(value) + 1) / 4.0) + 0.5
	self.color = Color(color.r, color.g, color.b, alpha)
	
	
func _process(_delta):
	flicker()
