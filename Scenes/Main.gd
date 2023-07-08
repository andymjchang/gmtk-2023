extends Node2D

var unitScene = preload("res://Objects/TestUnit.tscn")
var pathFollow2DScene = preload("res://Objects/PathFollow2D.tscn")
var enemyHP := 10

func _ready():
	$BgTile.visible = true

func update_hp(subtractAmount):
	enemyHP -= subtractAmount
	$RichTextLabel.text = "hp: " + str(enemyHP)


func _on_PlacementDetector_pressed():
	var pathFollowNode = pathFollow2DScene.instance()
	$Track1.add_child(pathFollowNode)
	pathFollowNode.add_child(unitScene.instance())


func _on_PlacementDetector2_pressed():
	var pathFollowNode = pathFollow2DScene.instance()
	$Track2.add_child(pathFollowNode)
	pathFollowNode.add_child(unitScene.instance())
