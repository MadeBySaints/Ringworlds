extends KinematicBody2D

export (int) var speed = 70

var velocity = Vector2()
var state_machine
var facing_dir

#enum emotes {
#	HAPPY
#	ANGRY
#	LOVE
#	HATE
#}

func _ready():
	state_machine = $AnimationTree.get("parameters/playback")
	pass

func get_input():
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
	if velocity.x.length() == 0 and velocity.y.length() == 0:
		idle()
		pass
	velocity = velocity.normalized() * speed
	
	if Input.is_action_just_pressed("attack"):
		attack()
	
	if Input.is_action_just_pressed("emote_radial"):# 4 slot radial emote menu
		emote()

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

func hurt():
	pass

func emote():
	pass

func idle():
	if facing_dir == "up":
		state_machine.travel("idleup")
	if facing_dir == "down":
		state_machine.travel("idledown")
	if facing_dir == "left":
		state_machine.travel("idleleft")
	if facing_dir == "right":
		state_machine.travel("idleright")
	pass
	
func attack():
	if facing_dir == "up":
		state_machine.travel("atkup")
	if facing_dir == "down":
		state_machine.travel("atkdown")
	if facing_dir == "left":
		state_machine.travel("atkleft")
	if facing_dir == "right":
		state_machine.travel("atkright")
