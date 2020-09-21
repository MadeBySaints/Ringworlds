extends CollisionShape2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Detection_Radius_area_entered(area):
	#later on, certain gear types might make sound, this sound will be represented
	#as an Area2D when it is active. This area collision should provide the same
	#functionality as _on_Detection_Radius_body_entered(body):
	pass # Replace with function body.


func _on_Detection_Radius_body_entered(body):
	#if player enters area, figure out direction to player then move and attack
	pass # Replace with function body.
