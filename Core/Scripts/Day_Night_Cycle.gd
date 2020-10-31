extends CanvasModulate


var cycle = {
	"Default": Color(1, 1, 1),
	"Dusk": Color(0.407843, 0.407843, 0.407843),
	"Dawn": Color(0.54902, 0.54902, 0.54902),
	"Purple_Moon": Color(0.376471, 0.247059, 1)
}
#enum preset {
#	SOLAR_ECLIPSE
#	EXTENDED_DAY
#	EXTENDED_NIGHT
#	PERM_DAY
#	PERM_NIGHT
#}

export (int) var multiplier = 1
# multiplier for cycle length 1 = 1 minute

export (int) var day_length
export (int) var dusk_length
export (int) var dawn_length
export (int) var night_length
export (int) var event_length

export (int) var trans_length
#transition length between cycles when canvas is lerping to new color


func _ready():
	self.set_color(cycle.Purple_Moon)


func _on_Timer_timeout():
	#restart timer
	pass # Replace with function body.
