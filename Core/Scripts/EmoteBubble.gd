extends Node2D

var i = 0
export (int) var max_i = 3

func _ready():
	pass

func happy():
	$AnimatedSprite.play("happy")
func angry():
	$AnimatedSprite.play("angry")
func love():
	$AnimatedSprite.play("love")
func hate():
	$AnimatedSprite.play("hate")

# pseudo timer for anim. change max_i to change the length
# of the anim. Lower numbers = shorter animation. Floats not supported.
func _on_AnimatedSprite_animation_finished():
	i += 1
	if i >= max_i:
		i = 0
		$AnimatedSprite.stop()
		.get_parent().remove_child(self)
