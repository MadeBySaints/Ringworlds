extends KinematicBody2D

enum Action {
	IDLE,
	NEW_DIR,
	MOVE
}

enum Vec {
	UP,
	DOWN,
	LEFT,
	RIGHT
}

const SPEED = 50
var state = Action.IDLE
var dir = Vector2.DOWN
var last_dir

func _ready():
	randomize()
	
func _physics_process(delta):
	match state:
		Action.IDLE:
			pass
			
		Action.NEW_DIR:
			dir = choose([Vector2.UP, Vector2.DOWN, Vector2.LEFT, Vector2.RIGHT])
			#update recent direction
			last_dir = dir
			if dir == Vector2.UP or dir == Vector2.DOWN:
				$CollisionShape2D.set_rotation_degrees(0)
			if dir == Vector2.LEFT or dir == Vector2.RIGHT:
				$CollisionShape2D.set_rotation_degrees(90)
			state = choose([Action.IDLE, Action.MOVE])
			
			#switch to idle if animal not moving
			if state == Action.IDLE and last_dir == Vector2.UP:
				$AnimatedSprite.play("idleup")
			if state == Action.IDLE and last_dir == Vector2.DOWN:
				$AnimatedSprite.play("idledown")
			if state == Action.IDLE and last_dir == Vector2.LEFT:
				$AnimatedSprite.play("idleleft")
			if state == Action.IDLE and last_dir == Vector2.RIGHT:
				$AnimatedSprite.play("idleright")
			
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
				
func move(delta):
	move_and_collide(dir * SPEED * delta)
	
func choose(array):
	array.shuffle()
	return array.front()
	
func _on_Timer_timeout():
	$Timer.wait_time = choose([1.0, 1.5])
	state = choose([Action.IDLE, Action.NEW_DIR, Action.MOVE])
