extends KinematicBody2D

enum {
	IDLE,
	NEW_DIR,
	MOVE
}

const SPEED = 25
var state = IDLE
var dir = Vector2.DOWN

func _ready():
	randomize()
	
func _process(delta):
	match state:
		IDLE:
			pass
			
		NEW_DIR:
			dir = choose([Vector2.UP, Vector2.DOWN, Vector2.LEFT, Vector2.RIGHT])
			if dir == Vector2.UP or dir == Vector2.DOWN:
				$CollisionShape2D.set_rotation_degrees(0)
			if dir == Vector2.LEFT or dir == Vector2.RIGHT:
				$CollisionShape2D.set_rotation_degrees(90)
			state = choose([IDLE, MOVE])
			
			if state == IDLE and dir == Vector2.UP:
				$AnimatedSprite.play("idleup")
			if state == IDLE and dir == Vector2.DOWN:
				$AnimatedSprite.play("idledown")
			if state == IDLE and dir == Vector2.LEFT:
				$AnimatedSprite.play("idleleft")
			if state == IDLE and dir == Vector2.RIGHT:
				$AnimatedSprite.play("idleright")
			
#			if state == IDLE:
#				print("animal idle")
		MOVE:
			move(delta)
			if dir == Vector2.UP:
				$AnimatedSprite.play("walkup")
			if dir == Vector2.DOWN:
				$AnimatedSprite.play("walkdown")
			if dir == Vector2.LEFT:
				$AnimatedSprite.play("walkleft")
			if dir == Vector2.RIGHT:
				$AnimatedSprite.play("walkright")
				

#	if dir == Vector2.UP:
#		$AnimatedSprite.animation = "idleup" #walkup - change after adding
#	if dir == Vector2.DOWN:
#		$AnimatedSprite.animation = "idledown"
#	if dir == Vector2.LEFT:
#		$AnimatedSprite.animation = "idleleft"
#	if dir == Vector2.RIGHT:
#		$AnimatedSprite.animation = "idleright"
func move(delta):
	position += dir * SPEED * delta
	
func choose(array):
	array.shuffle()
	return array.front()
	
func _on_Timer_timeout():
	$Timer.wait_time = choose([1.0, 1.5])
	state = choose([IDLE, NEW_DIR, MOVE])
