extends Node2D


func _on_PlayAgain_button_down():
	get_tree().change_scene("res://src/game.tscn")
