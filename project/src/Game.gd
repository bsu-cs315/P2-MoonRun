extends Node

onready var _level = get_node("Level")
onready var _player_animated = get_node("Level/Player/AnimatedSprite")
onready var _player = get_node("Level/Player")

func _process(delta):
	if _level._flag_collected:
		_player.movement = false
		_player.dancing = true
		_player_animated.play("Dance")
		yield(_player_animated, "animation_finished")
		get_tree().change_scene("res://src/Win_Screen.tscn")
	
	$CanvasLayer/CoinsCollected.text = String(get_node("Level")._coins_collected)

