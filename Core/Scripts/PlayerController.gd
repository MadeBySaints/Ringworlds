extends KinematicBody2D

const SPEED = 200
const ATTACK_SPEED = 400
const ATTACK_DURATION = 0.2
var state_machine
var facing_dir
var velocity = Vector2.ZERO
var current = state_machine.get_current_node()

var attacking = false
var attack_timer = 0

onready var attack_anim = $Attack_Animation
onready var attack_sound = $Attack_Sound

func _ready():
    state_machine = $AnimationTree.get("parameters/playback")
    facing_dir = "down"
func _physics_process(delta):
    velocity = Vector2.ZERO
    
    if Input.is_action_pressed("right"):
        velocity.x += SPEED
        state_machine.travel("walkright")
        facing_dir = "right"
    if Input.is_action_pressed("left"):
        velocity.x -= SPEED
        state_machine.travel("walkleft")
        facing_dir = "left"
    if Input.is_action_pressed("down"):
        velocity.y += SPEED
        state_machine.travel("walkdown")
        facing_dir = "down"
    if Input.is_action_pressed("up"):
        velocity.y -= SPEED
        state_machine.travel("walkup")
        facing_dir = "up"
    if velocity.length() == 0:
        state_machine.travel("idle" + str(facing_dir))
    
    velocity = velocity.normalized() * SPEED
    move_and_slide(velocity)

    if Input.is_action_pressed("attack") and not attacking:
        attacking = true
        attack_timer = ATTACK_DURATION
        attack_anim.play("attack")
        attack_sound.play()
        
    if attacking:
        attack_timer -= delta
        if attack_timer <= 0:
            attacking = false
            attack_anim.play("stop")
        
    velocity = velocity.normalized() * SPEED
    move_and_slide(velocity)
    
func _on_Attack_Animation_animation_finished():
    if attack_anim.current_animation == "stop":
        attack_anim.stop()
