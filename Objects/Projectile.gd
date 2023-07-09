extends KinematicBody2D

var direction
var spd
var dmg
var hit := false
var colorType = "white"

func initialize(p_direction, p_speed, p_damage, p_color):
	direction = p_direction
	spd = p_speed
	dmg = p_damage
	$Sprite.modulate = ColorN(p_color, 1)
	colorType = p_color

func _process(delta):
	position = position + spd * direction * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func on_hit(other, p_colorType):
	hit = true
	queue_free()
	
	var dmgMultiplier = calc_dmg_multiplier(p_colorType)
	other.hp -= dmg * dmgMultiplier

func calc_dmg_multiplier(p_colorType):
	var dmgMultiplier = 1
	# calculate damage based on elemental type
	
	# acting on red
	if p_colorType == "red":
		if colorType == "blue":
			dmgMultiplier = 2
		if colorType == "red" or colorType == "darkgreen":
			dmgMultiplier = 0.5
	# acting on blue
	if p_colorType == "blue":
		if colorType == "darkgreen":
			dmgMultiplier = 2
		if colorType == "blue" or colorType == "red":
			dmgMultiplier = 0.5
	# acting on green
	if p_colorType == "green":
		if colorType == "red":
			dmgMultiplier = 2
		if colorType == "blue" or colorType == "darkgreen":
			dmgMultiplier = 0.5
	
	return dmgMultiplier
		
