extends KinematicBody2D

export (int) var speed = 70

var velocity = Vector2()
var state_machine

func _ready():
	state_machine = $AnimationPlayer.get("parameters/playback")
	pass

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
		
	velocity = velocity.normalized() * speed
#
#func rot_col():
#	if Input.is_action_pressed("up")

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

