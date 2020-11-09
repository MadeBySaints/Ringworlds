extends Node

class_name Utils

var gamestate
var g = Performance.get_monitor(Performance.OBJECT_ORPHAN_NODE_COUNT)
var data = []

func _ready():
	pass
	
func _enter_tree() -> void:
	.get_tree().connect("node_added", data, "append")
	
func garbage_collection() -> void:
	#queue free any orphaned nodes on main, scene change, and quit()
	var keep = []
	for a_node in data:
		if is_instance_valid(a_node):
			if not a_node.is_in_tree() and not a_node.is_queued_for_deletion():
				a_node.queue_free()
			else:
				keep.append(a_node)
	data = keep
	print(g)

func scene_reload():
	pass
