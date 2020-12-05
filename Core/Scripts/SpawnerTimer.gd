extends YSort


var dirh = ["LEFT", "RIGHT"]
var dirv = ["UP", "DOWN"]

var h
var v
var rem_time
var spawn_name

export (PackedScene) var entity
export (float) var time = 5.0
export (int) var max_spawns = 5
export (int) var min_spawn_distance = 1
export (int) var max_spawn_distance = 5

var spawned
var spawn


func _physics_process(_delta):
	rem_time = $Timer.get_wait_time()


func _ready():
	randomize()
	pass


func choose(array):
	array.shuffle()
	return array.front()


func set_spawn_coords():
	var a = choose(dirh)
	var b = choose(dirv)
	if a == "LEFT":
		h = -h
		return(h)
	if b == "UP":
		v = -v
		return(v)


func name_spawn():
	spawn_name = spawn.name + str(OS.get_unix_time())
	return(spawn_name)


func _on_Timer_timeout():
	$Timer.wait_time = time
	spawned = get_child_count() - 1
	if spawned >= max_spawns:
		print(str(spawned) + " nodes already spawned.")
		return
	else:
		h = randi() % max_spawn_distance + min_spawn_distance * 16
		v = randi() % max_spawn_distance + min_spawn_distance * 16
		spawn = entity.instance()
		set_spawn_coords()
		spawn.position = Vector2(h, v)
		print(spawn.position)#debug
		name_spawn()
		spawn.name = spawn_name
		print(spawn.name)
		add_child(spawn)
		spawn.connect("dead", self, "entity_dead")


func entity_dead(entity_name):
	entity_name.queue_free()
	pass

