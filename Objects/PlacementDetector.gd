extends Node2D

signal pressed
var tileIsFree := true

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event.is_action_just_pressed("mouse_left") and tileIsFree:
		emit_signal("pressed")
