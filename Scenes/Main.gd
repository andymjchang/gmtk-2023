extends Node2D

var ratDmg = [1, 2, 2, 2]


var unitScene = preload("res://Objects/TestUnit.tscn")
onready var toggleNode = get_node("PlacementDetectorGroup/Toggle")
var enemyHP := 10
var playerGold := 100
var currentWave := 0
var totalWaves := 10
var elementArray = ["red", "darkgreen", "blue"]
onready var trackID = get_node("Track1")

func _ready():
	randomize()
	$BgTile.visible = true

func _process(_delta):
	update_stats()

func update_stats():
	$HPLabel.text = "HP:" + str(enemyHP)
	$RichTextLabel.text = "GOLD:" + str(playerGold)
	$RichTextLabel.text = $RichTextLabel.text + "\nWAVE:" + str(currentWave) + "/" + str(totalWaves)
	$RichTextLabel.text = $RichTextLabel.text + "\nNEXT:" + str($WaveTimer.time_left)

func update_hp(subtractAmount):
	enemyHP -= subtractAmount

func new_wave():
	if currentWave < totalWaves:
		currentWave += 1
		new_tower()
		playerGold += 50 * currentWave
	

func new_tower():
	var towerArray = $EnemyUnits.get_children()
	var index = randi() % $EnemyUnits.get_child_count()
	if towerArray[index].visible == true:
		upgrade_tower(towerArray[index])
	else:
		towerArray[index].visible = true

func upgrade_tower(towerNode):
	# check if tower is upgraded already
	# three stages of tower: basic, elemental, crowned elemental
	if towerNode.colorType == "white":
		towerNode.colorType = elementArray[randi() % 3]
		towerNode.bulletDmg += 1
		towerNode.bulletSpd += 50
		towerNode.modulate_color()
	elif towerNode.get_node("Sprite").frame > 0: # not crowned yet
		towerNode.get_node("Sprite").frame = 0
		towerNode.bulletDmg += 1
		towerNode.bulletSpd += 100
	else: #pick another tower
		new_tower()
		

func place_unit(p_cost, p_color):
	if playerGold >= p_cost:
		var child = unitScene.instance()
		trackID.add_child(child)
		child.get_node("PlayerUnit").initialize(p_color, 1, 30)
		playerGold -= p_cost
		
func _on_WaveTimer_timeout():
	new_wave()

func _on_RatButton1_pressed():
	place_unit(50, "white")
func _on_RatButton2_pressed():
	place_unit(150, "green")
func _on_RatBuutton3_pressed():
	place_unit(150, "blue")
func _on_RatButton4_pressed():
	place_unit(150, "red")

func _on_ToggleArea2D_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("mouse_left"):
		if toggleNode.frame == 0:
			toggleNode.frame = 1
			trackID = get_node("Track2")
		else: 
			toggleNode.frame = 0
			trackID = get_node("Track1")



func _on_ToggleArea2D_mouse_entered():
	$UnitPortrait.load_info("rat", "Toggle between spawn locations", 0)

func _on_Area2D_mouse_entered_white():
	$UnitPortrait.load_info("rat", "Wind Rat", ratDmg[0]) 


func _on_Area2D_mouse_entered_green():
	$UnitPortrait.load_info("rat", "Grass Rat", ratDmg[1]) 

func _on_Area2D_mouse_entered_blue():
	$UnitPortrait.load_info("rat", "Water Rat", ratDmg[2]) 

func _on_Area2D_mouse_entered_red():
	$UnitPortrait.load_info("rat", "Fire Rat", ratDmg[3]) 
