extends Node2D

var direction
var spd
var dmg

func initialize(p_direction, p_speed, p_damage):
	direction = p_direction
	spd = p_speed
	dmg = p_damage

func _process(delta):
	position = position + spd * direction * delta

#func find_closest_target():
#	var unitArray = get_tree().get_nodes_in_group("UnitNode")
#	# check if 
#	for node in unitArray:
#		if node.global_position.distance_to(parentPosition) < 
