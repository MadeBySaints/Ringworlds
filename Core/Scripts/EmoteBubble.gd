extends Node2D


var a
var iter = 0
export (int) var max_iter = 3
var process
#set position

func _init():
	
	pass

func _ready():
	pass

#set animation name
func happy():
	$AnimatedSprite.play("happy")
	
	
func angry():
	$AnimatedSprite.play("angry")
	
	
func love():
	$AnimatedSprite.play("love")
	
	
func hate():
	$AnimatedSprite.play("hate")



#queue free when complete



# pseudo timer for animation - time controlled with speed_scale(1.0)
func _on_AnimatedSprite_animation_finished():
	iter += 1
	if iter >= max_iter:
		iter = 0
		$AnimatedSprite.stop()
		.get_parent().remove_child(self)
