extends KinematicBody2D

onready var path_follow = get_parent()

var speed := 25
var dmg := 1
var hp := 100

func _process(delta):	
	$RichTextLabel.text = str(hp)
	# check for end of path
	if path_follow.unit_offset == 1:
		end_of_path()
		
	path_follow.set_offset(path_follow.get_offset() + speed * delta)

	if hp <= 0:
		free_path()
		
func end_of_path():
	# access the current main node
	for mainNode in get_tree().get_nodes_in_group("MainNode"):
		mainNode.update_hp(dmg)
	free_path()

	
func free_path():
	path_follow.queue_free()
	queue_free()
	
func take_dmg(p_dmg):
	hp -= p_dmg
	if hp <= 0:
		free_path()

func _on_Area2D_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print(area.get_parent().hit)
	
	if area.is_in_group("BulletNode") and area.get_parent().hit == false:
		area.get_parent().on_hit(self)

