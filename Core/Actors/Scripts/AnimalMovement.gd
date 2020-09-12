extends KinematicBody2D

export (int) var speed = 100

var velocity = Vector2()

var default_dir = 0
#0 = idle 1=U 2=D 3=L 4=R

var wait = 80
var move = randi() % 100 + 1
var dir = 0

func rand_move():
	velocity = Vector2()
	if move == 0:
		dir = 0
	if move > 0 and move < 25:
		velocity.y -= 1 #Up
		dir = 1
		rot_col()
	if move > 24 and move < 50:
		velocity.y += 1 #Down
		dir = 2
		rot_col()
	if move > 50 and move < 75:
		velocity.x -= 1 #Left
		dir = 3
		rot_col()
	if move > 75:
		velocity.x += 1 #Right
		dir = 4
		rot_col()
		
	velocity = velocity.normalized() * speed
	
func rot_col():
	if dir == 1 or dir == 3:
		Transform2D(0, velocity)
	if dir == 2 or dir == 4:
		Transform2D(90, velocity)
	if dir == 0:
		print("animal idle")

func _physics_process(delta):
	rand_move()
	velocity = move_and_slide(velocity)

func _ready():
	pass
