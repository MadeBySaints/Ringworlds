extends Node

class_name Utils

var gamestate
var data = []

func _ready():
	print_stray_nodes()
	pass


func _enter_tree():
	.get_tree().get_root().connect("node_added", data, "append")


func garbage_collection():
	#queue free any orphaned nodes on main, scene change, and quit()
	var keep = []
	for a_node in data:
		if is_instance_valid(a_node):
			if not a_node.is_in_tree():# and not a_node.is_queued_for_deletion():
				a_node.queue_free()
			else:
				keep.append(a_node)
	data = keep
	print(Performance.get_monitor(Performance.OBJECT_ORPHAN_NODE_COUNT))


func scene_reload():
	pass
