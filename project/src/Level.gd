extends Node2D

var _coins_collected = 0
var play_dance = false
var _flag_collected = false

func _process(delta):
	if _flag_collected and play_dance:
		get_tree().change_scene("res://src/Win_Screen.tscn")

func _on_Flag_body_entered(body):
	if body.get_name() == "Player":
		if _coins_collected == 1:
			print("Flag Collected!")
			_flag_collected = true



func _on_Coin_body_entered(body):
	if body.get_name() == "Player":
		print("Coin Collected!")
		_coins_collected += 1
		$Coin.queue_free()
