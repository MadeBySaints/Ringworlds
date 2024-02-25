# Enemy.gd

extends KinematicBody2D

export var speed = 100
export var health = 3

var velocity = Vector2()

func _physics_process(delta):
    # Move the enemy based on its velocity and speed
    velocity = move_and_slide(velocity.normalized() * speed)
    
    # Check if the enemy's health has reached zero
    if health <= 0:
        queue_free()
    
    # If the enemy falls out of the screen, destroy it
    if position.y > get_viewport_rect().size.y:
        queue_free()
    
func take_damage(damage):
    # Reduce the enemy's health by the amount of damage taken
    health -= damage
