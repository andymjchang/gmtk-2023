extends Node2D

var unitScene = preload("res://Objects/TestUnit.tscn")
var enemyHP := 10

func _ready():
	$BgTile.visible = true
	
	# testing track spawning
	$Track1/PathFollow2D.add_child(unitScene.instance())
	$Track2/PathFollow2D.add_child(unitScene.instance())


func update_hp(subtractAmount):
	enemyHP -= subtractAmount
	$RichTextLabel.text = "hp: " + str(enemyHP)
