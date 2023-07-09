extends Node2D

var atkSpd = 1
var bulletDmg = 1
var bulletSpd = 300
var bulletNode = preload("res://Objects/Projectile.tscn")
var colorType = "white"

func _ready():
	$Timer.start()
	
	# pick random frame but not frame 0
	$Sprite.frame = (randi() % 4) + 1
	
func modulate_color():
	$Sprite.material.set_shader_param("outline_color", ColorN(colorType, 1))

func find_closest_target():
	var unitArray = get_tree().get_nodes_in_group("UnitNode")

	if unitArray.size() > 0 and visible == true:
		var dirVector = unitArray[0].global_position - global_position
		dirVector = dirVector.normalized()
		var bulletInstance = bulletNode.instance()
		add_child(bulletInstance)
		bulletInstance.initialize(dirVector, bulletSpd, bulletDmg, colorType)

func _on_Timer_timeout():
	find_closest_target()
	$Timer.wait_time = 1 / atkSpd
	$Timer.start()

func _on_Area2D_mouse_entered():
	for portraitNode in get_tree().get_nodes_in_group("UnitPortrait"):
		var displayName
		if colorType == "white":
			displayName = "Wind Cat"
		if colorType == "darkgreen":
			displayName = "Grass Cat"
		if colorType == "red":
			displayName = "Fire Cat"
		if colorType == "blue":
			displayName = "Water Cat"
			
		portraitNode.load_info(colorType, displayName, bulletDmg)
