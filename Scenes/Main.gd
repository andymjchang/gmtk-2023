extends Node2D

var unitScene = preload("res://Objects/TestUnit.tscn")
var unitInstance = unitScene.instance()

func _ready():
	$BgTile.visible = true
	
	# testing track spawning
	$Track1/PathFollow2D.add_child(unitInstance)

#func _process(delta):
#	pass

func _input(event):
	if event.is_action_pressed("mouse_left"):
		pass
