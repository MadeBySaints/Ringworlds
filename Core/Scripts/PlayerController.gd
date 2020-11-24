extends KinematicBody2D

#const util = preload("res://Core/Scripts/Utilities.gd")

export (int) var speed = 70

var velocity = Vector2()
var state_machine
var facing_dir

#var u = util.new()

func _ready():
	state_machine = $AnimationTree.get("parameters/playback")
	facing_dir = "down"
	pass

func get_input():
	#initialize velocity so player doesnt run away
	velocity = Vector2()
#	var current = state_machine.get_current_node()
#	print(current)
	
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		state_machine.travel("walkup")
		facing_dir = "up"
	if Input.is_action_pressed("down"):
		velocity.y += 1
		state_machine.travel("walkdown")
		facing_dir = "down"
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		state_machine.travel("walkleft")
		facing_dir = "left"
	if Input.is_action_pressed("right"):
		velocity.x += 1
		state_machine.travel("walkright")
		facing_dir = "right"
	if velocity.length() == 0:
		state_machine.travel("idle" + str(facing_dir))
	velocity = velocity.normalized() * speed


	if Input.is_action_just_pressed("attack"):
		state_machine.travel("atk" + str(facing_dir))



###Debug###
#	if Input.is_action_just_pressed("garbage_collect"):
#		if OS.is_debug_build():
#			u.garbage_collection()
		
		
func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
	

func hurt():
	pass

	
