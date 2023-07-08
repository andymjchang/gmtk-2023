extends Node2D

var unitScene = preload("res://Objects/TestUnit.tscn")
var enemyHP := 10

func _ready():
	randomize()
	$BgTile.visible = true
	new_tower()

func update_hp(subtractAmount):
	enemyHP -= subtractAmount
	$RichTextLabel.text = "hp: " + str(enemyHP)

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
	
func _on_PlacementDetector_pressed():
	$Track1.add_child(unitScene.instance())

func _on_PlacementDetector2_pressed():
	$Track2.add_child(unitScene.instance())
