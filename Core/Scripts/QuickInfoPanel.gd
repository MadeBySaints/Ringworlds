extends Position2D


#Quick Info Panel QIP
#Contains useful player stats such as HP, MP, EXP, NAME, LEVEL, etc


var pname setget set_text, get_text

func _ready():
	pass # Replace with function body.

func set_text(new_text):
	$"HBoxContainer/Name Text".text = str(new_text)
	
func get_text():
	return $"HBoxContainer/Name Text".text


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
