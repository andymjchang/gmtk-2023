extends Area2D

onready var path_follow = get_parent()

var speed = 25

func _physics_process(delta):	
	# check for end of path
	if path_follow.unit_offset == 1:
		queue_free()
		
	path_follow.set_offset(path_follow.get_offset() + speed * delta)
