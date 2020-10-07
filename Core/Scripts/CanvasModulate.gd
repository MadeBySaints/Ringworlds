extends CanvasModulate

enum colors {
	DEFAULT,
	DUSK,
	DAWN,
	RED,
	ORANGE,
	YELLOW,
	GREEN,
	BLUE,
	INDIGO,
	VIOLET
}

var col = get_color()

export (int) var multiplier = 1
#multiplier for wait time... 1 = 1 minute

export (int) var day_length
export (int) var dusk_length
export (int) var dawn_length
export (int) var night_length
export (int) var event_length

export (int) var trans_length
#transition length between cycles


#var default = Color(1, 1, 1)
#var dusk = Color(0.407843, 0.407843, 0.407843)
#var dawn = Color(0.54902, 0.54902, 0.54902)
#var reddusk = Color(0.734375, 0.327026, 0.327026)
#var purplemoon = Color(0.376471, 0.247059, 1)
#future colors include rainbow and rgb flashing


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
