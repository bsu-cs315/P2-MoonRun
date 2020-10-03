extends Node2D

var _coins_collected = 0
var play_dance = false
var _flag_collected = false

func _process(delta):
	if _flag_collected and play_dance:
		get_tree().change_scene("res://src/Win_Screen.tscn")

func _on_Flag_body_entered(body):
	if body.get_name() == "Player":
		if _coins_collected == 3:
			print("Flag Collected!")
			_flag_collected = true



func _on_Coin_body_entered(body):
	if body.get_name() == "Player":
		print("Coin Collected!")
		$CoinCollection.play()
		_coins_collected += 1
		$Coin.queue_free()


func _on_Coin2_body_entered(body):
	if body.get_name() == "Player":
		print("Coin2 Collected!")
		$CoinCollection.play()
		_coins_collected += 1
		$Coin2.queue_free()


func _on_Coin3_body_entered(body):
	if body.get_name() == "Player":
		print("Coin3 Collected!")
		$CoinCollection.play()
		_coins_collected += 1
		$Coin3.queue_free()
