extends Position2D

enum dirv {
	UP,
	DOWN
}
enum dirh {
	LEFT,
	RIGHT
}

var v
var h
var posh = Vector2()
var posv = Vector2()
var spawn_position
onready var dist = randi() % max_spawn_distance + min_spawn_distance * 16
export (PackedScene) var entity
export (int) var time = 5
export (int) var max_spawns = 5
export (int) var min_spawn_distance = 1
export (int) var max_spawn_distance = 5

#spawn coordinates
#spawned entity name
#get number of nodes spawned to determine how many entities are still alive

onready var spawn = entity.instance()
onready var spawned: int = 0


func _ready():
	randomize()
	var entity_node = spawn.get_node()
	entity_node.connect("dead", self, entity_dead())
	pass


func choose(array):
	array.shuffle()
	return array.front()


func set_dir():
	v = choose(dirv)
	h = choose(dirh)
	pass


func get_h():
	h = choose(dirh)
	if h == "LEFT":
		posh = Vector2(-dist, 0)
		return(posh)
	else:
		posh = Vector2(dist, 0)
		return(posh)


func get_v():
	v = choose(dirv)
	if v == "UP":
		posv = Vector2(0, -dist)
		return(posv)
	else:
		posv = Vector2(0, dist)
		return(posv)


func set_spawn_location():
	get_h()
	get_v()
	spawn_position = Vector2(posh, posv)
	spawn_entity()


func _physics_process(_delta):
	var rem_time = $Timer.get_wait_time()
	print(rem_time) #debug


func _on_Timer_timeout():
	if spawned >= max_spawns:
		$Timer.wait_time = time
		return
	else:
		spawned += 1
		set_spawn_location()


func entity_dead():
	spawned -= 1


func spawn_entity():
	spawn.position = spawn_position
	add_child(spawn)
