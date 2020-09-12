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
#			if dir == Vector2.UP or dir == Vector2.DOWN:
#				$CollisionShape2D.Transform2D(0, dir)
#			if dir == Vector2.LEFT or dir == Vector2.RIGHT:
#				$CollisionShape2D.Transform2D(90, dir)
			state = choose([IDLE, MOVE])
			
#			if state == IDLE:
#				print("animal idle")
		MOVE:
			move(delta)

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
	$Timer.wait_time = choose([0.1, 0.3])
	state = choose([IDLE, NEW_DIR, MOVE])
