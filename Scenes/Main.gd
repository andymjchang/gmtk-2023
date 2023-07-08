extends Node2D

var unitScene = preload("res://Objects/TestUnit.tscn")
var enemyHP := 10
var playerGold := 100

func _ready():
	update_stats()
	randomize()
	$BgTile.visible = true
	new_tower()

func update_stats():
	$RichTextLabel.text = "HP:" + str(enemyHP) + "\nGOLD:" + str(playerGold)

func update_hp(subtractAmount):
	enemyHP -= subtractAmount
	update_stats()

func new_tower():
	var towerArray = $EnemyUnits.get_children()
	var index = randi() % $EnemyUnits.get_child_count()
	if towerArray[index].visible == true:
		upgrade_tower(towerArray[index])
	else:
		towerArray[index].visible = true

func upgrade_tower(towerNode):
	print(towerNode.name + "dmg + 1")
	towerNode.bulletDmg += 1

func place_unit(track):
	if playerGold >= 10:
		track.add_child(unitScene.instance())
		playerGold -= 10
		update_stats()
		
func _on_PlacementDetector_pressed():
	place_unit($Track1)

func _on_PlacementDetector2_pressed():
	place_unit($Track2)
