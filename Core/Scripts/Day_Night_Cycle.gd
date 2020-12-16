extends CanvasModulate

var types = [
	"Light2D",
	"AnimatedSprite"
]

var cycle = {
	"Default": Color(1, 1, 1),
	"Dusk": Color(0.407843, 0.407843, 0.407843),
	"Dawn": Color(0.54902, 0.54902, 0.54902),
	"Purple_Moon": Color(0.376471, 0.247059, 1)
}

onready var current_cycle = cycle.Default#returns Color(n,n,n)

func _process(_delta):
	if current_cycle == cycle.Default:
		pass
	else:
		pass



func _ready():
	pass


func update_cycle():
	if current_cycle == cycle.Default:
		current_cycle = cycle.Dusk
		
	elif current_cycle == cycle.Dusk:
		current_cycle = cycle.Purple_Moon
	elif current_cycle == cycle.Purple_Moon:
		current_cycle = cycle.Dawn
	elif current_cycle == cycle.Dawn:
		current_cycle = cycle.Default
	else:
		return(current_cycle)

func _on_Timer_timeout():
	$Timer.set_wait_time(6)
	update_cycle()
	color = current_cycle
