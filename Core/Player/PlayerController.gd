extends KinematicBody2D

export (int) var speed = 70

var velocity = Vector2()
var state_machine
var facing_dir
#var a = preload("res://Core/Scripts/EmoteBubble.gd")

var emote = load("res://Core/Abstract Scenes/Emoji.tscn")#script
var a = emote.instance()

func _ready():
	state_machine = $AnimationTree.get("parameters/playback")
	pass

func get_input():
	#initialize velocity so player doesnt run away
	velocity = Vector2()
	var current = state_machine.get_current_node()
	
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
#	if Input.is_action_just_pressed("emote_radial"):
		#display radial menu
##		pass
#	if a != null:
	if Input.is_action_just_pressed("emote1"):
		a.happy()
		add_child(a)
	if Input.is_action_just_pressed("emote2"):
		a.angry()
		add_child(a)
	if Input.is_action_just_pressed("emote3"):
		a.love()
		add_child(a)
	if Input.is_action_just_pressed("emote4"):
		a.hate()
		add_child(a)
#	else:
#		print(str(a) + "is running")

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
	

func hurt():
	pass

#func emote():
#	pass
	
