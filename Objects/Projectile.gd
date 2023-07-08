extends KinematicBody2D

var direction
var spd
var dmg
var hit := false

func initialize(p_direction, p_speed, p_damage):
	direction = p_direction
	spd = p_speed
	dmg = p_damage

func _process(delta):
	position = position + spd * direction * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func on_hit(other):
	hit = true
	queue_free()
	other.hp -= dmg
