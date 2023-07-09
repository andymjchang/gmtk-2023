extends KinematicBody2D

onready var path_follow = get_parent()

var speed := 30
var dmg := 1
var hp := 5
var last_position
export var turn_threshold := 0.15

func _ready():
	$Sprite2D.speed_scale = rand_range(0.8, 1.2)
	last_position = global_position

func initialize(colorName, p_dmg, p_speed):
	$Sprite2D.modulate = ColorN(colorName, 1)

func _process(delta):
	# check for death
	if hp <= 0:
		free_path()
		
	# update healthbar
	$RichTextLabel.bbcode_text = "[center]" + str(hp) + "[center]"
	
	# check for end of path
	if path_follow.unit_offset == 1:
		end_of_path()
		
	# move along pathFollow
	path_follow.set_offset(path_follow.get_offset() + speed * delta)
	
	# check for movement direction
	if (global_position.x - last_position.x) > turn_threshold:
		$Sprite2D.scale.x = 0.5
	else:
		$Sprite2D.scale.x = -0.5
	last_position = global_position
	
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

func _on_Area2D_area_shape_entered(_area_rid, area, _area_shape_index, _local_shape_index):
	if area.is_in_group("BulletNode") and area.get_parent().hit == false:
		area.get_parent().on_hit(self)

