# EnemySpawner.gd

extends Node2D

export var max_enemies = 5
export (NodePath) var collision_shape_path

var timer = 0
var collision_shape

func _ready():
    # Get the CollisionShape2D node referenced by collision_shape_path
    collision_shape = get_node(collision_shape_path)

func _process(delta):
    timer += delta
    if timer >= 10 and get_tree().get_nodes_in_group("enemies").size() < max_enemies:
        spawn_enemy()
        timer = 0

func spawn_enemy():
    var enemy = Enemy.instance()
    var spawn_pos = Vector2(randi() % 800, randi() % 600)
    
    # Check for collision at spawn_pos using the CollisionShape2D
    var collision = collision_shape.collide_with_motion(enemy, spawn_pos - enemy.position)
    if collision == 0:
        # No collision, so set the enemy position and add it to the scene
        enemy.position = spawn_pos
        add_child(enemy)
