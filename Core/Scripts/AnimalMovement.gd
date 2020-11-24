extends KinematicBody2D

enum Action {
	IDLE,
	NEW_DIR,
	MOVE
}

const SPEED = 50
var state = Action.IDLE
var dir = Vector2.DOWN
var last_dir

export (float) var wait_min = 1.0
export (float) var wait_max = 1.5

func _ready():
	randomize()
	
func _process(delta):
	match state:
		Action.IDLE:
			if last_dir == Vector2.UP:
				$AnimatedSprite.play("idleup")
			if last_dir == Vector2.DOWN:
				$AnimatedSprite.play("idledown")
			if last_dir == Vector2.LEFT:
				$AnimatedSprite.play("idleleft")
			if last_dir == Vector2.RIGHT:
				$AnimatedSprite.play("idleright")
			
		Action.NEW_DIR:
			dir = choose([Vector2.UP, Vector2.DOWN, Vector2.LEFT, Vector2.RIGHT])
			if dir == Vector2.UP or dir == Vector2.DOWN:
				$CollisionShape2D.set_rotation_degrees(0)
			if dir == Vector2.LEFT or dir == Vector2.RIGHT:
				$CollisionShape2D.set_rotation_degrees(90)
			state = choose([Action.IDLE, Action.MOVE])
			
		Action.MOVE:
			move(delta)
			
			if dir == Vector2.UP:
				$AnimatedSprite.play("walkup")
			if dir == Vector2.DOWN:
				$AnimatedSprite.play("walkdown")
			if dir == Vector2.LEFT:
				$AnimatedSprite.play("walkleft")
			if dir == Vector2.RIGHT:
				$AnimatedSprite.play("walkright")
			#update recent direction
			last_dir = dir
				
func move(_delta):
	move_and_slide(dir * SPEED)
	
func choose(array):
	array.shuffle()
	return array.front()
	
func _on_Timer_timeout():
	$Timer.wait_time = choose([wait_min, wait_max])
	state = choose([Action.IDLE, Action.NEW_DIR, Action.MOVE])
