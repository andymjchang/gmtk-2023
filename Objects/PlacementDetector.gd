extends Node2D

signal pressed
var tileIsFree := true
export var detectorIndex := 0

func _on_Area2D_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("mouse_left") and tileIsFree:
		emit_signal("pressed")
		print("pressed " + str(detectorIndex))
