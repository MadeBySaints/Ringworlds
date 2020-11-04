extends Node2D

class_name Emoji

var iter = 0
export (int) var max_iter = 3
#set position


func _ready():
	pass

func get_pos():
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
		queue_free()
