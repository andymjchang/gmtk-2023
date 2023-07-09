extends Node2D

var atkSpd = 1
var bulletDmg = 1
var bulletSpd = 300
var bulletNode = preload("res://Objects/Projectile.tscn")

func _ready():
	$Timer.start()

func find_closest_target():
	var unitArray = get_tree().get_nodes_in_group("UnitNode")

	if unitArray.size() > 0 and visible == true:
		var dirVector = unitArray[0].global_position - global_position
		dirVector = dirVector.normalized()
		var bulletInstance = bulletNode.instance()
		add_child(bulletInstance)
		bulletInstance.initialize(dirVector, bulletSpd, bulletDmg)

func _on_Timer_timeout():
	find_closest_target()
	$Timer.wait_time = 1 / atkSpd
	$Timer.start()
