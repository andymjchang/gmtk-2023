extends Area2D

onready var path_follow = get_parent()

var speed := 25
var dmg := 1
var hp := 1

func _physics_process(delta):	
	# check for end of path
	if path_follow.unit_offset == 1:
		end_of_path()
		
	path_follow.set_offset(path_follow.get_offset() + speed * delta)

func end_of_path():
	# access the current main node
	for mainNode in get_tree().get_nodes_in_group("MainNode"):
		mainNode.update_hp(dmg)
	
	# free pathFollow2D as well
	path_follow.queue_free()
	queue_free()
