extends Node

onready var level = get_node("Level")
onready var player_animated = get_node("Level/Player/AnimatedSprite")
onready var player = get_node("Level/Player")

func _process(delta):
	if level._flag_collected:
		player.movement = false
		player.dancing = true
		player_animated.play("Dance")
		yield(player_animated, "animation_finished")
		get_tree().change_scene("res://src/Win_Screen.tscn")

