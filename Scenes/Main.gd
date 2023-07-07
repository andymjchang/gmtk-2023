extends Node2D

func _ready():
	$BgTile.visible = true

#func _process(delta):
#	pass

func _input(event):
	if event.is_action_pressed("mouse_left"):
		pass
