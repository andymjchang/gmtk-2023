extends Node2D

onready var mainScene = get_parent()

func _ready():
	global_position.x -= 50	
	get_tree().paused = true
	
	if mainScene.currentWave == 2 or mainScene.currentWave == 5 or mainScene.currentWave == 7 or mainScene.currentWave == 9:
		$RichTextLabel.text = "Slightly increase HP"
		$RichTextLabel2.text = "Slightly increase ATK"
		$RichTextLabel3.text = "Slightly increase HP"
		$RichTextLabel4.text = "Slightly increase ATK"
		
	if mainScene.currentWave == 3:
		$RichTextLabel.text = "Increase movement speed for all rats"
		$RichTextLabel2.text = "Increase atk massively, decrease health"
		$RichTextLabel3.text = "Increase base gold generation"
		$RichTextLabel4.text = "Increase gold per round"
		
	if mainScene.currentWave == 4 or mainScene.currentWave == 6 or mainScene.currentWave == 8 or mainScene.currentWave == 10:
		$RichTextLabel.text = "Slightly increase ATK"
		$RichTextLabel2.text = "Slightly increase HP"
		$RichTextLabel3.text = "Slightly increase ATK"
		$RichTextLabel4.text = "Slightly increase HP"

func exit_menu():
	get_tree().paused = false
	queue_free()

func _on_PlacementDetector_pressed1():
	if mainScene.currentWave == 2 or mainScene.currentWave == 5 or mainScene.currentWave == 7 or mainScene.currentWave == 9:
		mainScene.ratHp[0] += 1
	if mainScene.currentWave == 4 or mainScene.currentWave == 6 or mainScene.currentWave == 8 or mainScene.currentWave == 10:
		mainScene.ratDmg[0] += 1
	if mainScene.currentWave == 3:
		mainScene.ratSpeed += 30
	exit_menu()

func _on_PlacementDetector_pressed2():
	if mainScene.currentWave == 2 or mainScene.currentWave == 5 or mainScene.currentWave == 7 or mainScene.currentWave == 9:
		mainScene.ratDmg[1] += 1
	if mainScene.currentWave == 4 or mainScene.currentWave == 6 or mainScene.currentWave == 8 or mainScene.currentWave == 10:
		mainScene.ratHp[1] += 1
	if mainScene.currentWave == 3:
		mainScene.ratHp[1] -= 5
		mainScene.ratDmg[1] += 5
	exit_menu()
func _on_PlacementDetector_pressed3():
	if mainScene.currentWave == 2 or mainScene.currentWave == 5 or mainScene.currentWave == 7 or mainScene.currentWave == 9:
		mainScene.ratHp[2] += 1
	if mainScene.currentWave == 4 or mainScene.currentWave == 6 or mainScene.currentWave == 8 or mainScene.currentWave == 10:
		mainScene.ratDmg[2] += 1
	if mainScene.currentWave == 3:
		mainScene.baseGold += 50
	exit_menu()
func _on_PlacementDetector_pressed4():
	if mainScene.currentWave == 2 or mainScene.currentWave == 5 or mainScene.currentWave == 7 or mainScene.currentWave == 9:
		mainScene.ratDmg[3] += 1
	if mainScene.currentWave == 4 or mainScene.currentWave == 6 or mainScene.currentWave == 8 or mainScene.currentWave == 10:
		mainScene.ratHp[3] += 1
	if mainScene.currentWave == 3:
		mainScene.baseGold += 30
	exit_menu()
