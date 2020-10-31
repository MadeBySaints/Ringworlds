extends CanvasModulate
var a
var b
#access with cycle.4.["Purple Moon"]
var cycle = {
	"Default": Color(1, 1, 1),
	"Dusk": Color(0.407843, 0.407843, 0.407843),
	"Dawn": Color(0.54902, 0.54902, 0.54902),
	"Purple_Moon": Color(0.376471, 0.247059, 1)
}
enum preset {
	SOLAR_ECLIPSE
	EXTENDED_DAY
	EXTENDED_NIGHT
	PERM_DAY
	PERM_NIGHT
}

	
#multiplier for wait time... 1 = 1 minute
export (int) var multiplier = 1

export (int) var day_length
export (int) var dusk_length
export (int) var dawn_length
export (int) var night_length
export (int) var event_length

export (int) var trans_length
#transition length between cycles


func _ready():
	self.set_color(cycle.Purple_Moon)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	#restart timer
	#Color(0.407843, 0.407843, 0.407843) dusk
	# dawn
	#Color(1, 1, 1) full bright
	# red dusk
	# purple moon
	
	#color [default: Color( 1, 1, 1, 1 )]
	#set_color(value) setter
	#get_color() getter

	#if 
	pass # Replace with function body.
