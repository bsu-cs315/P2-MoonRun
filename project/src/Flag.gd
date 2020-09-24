extends Area2D




func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		print("Flag Collected")
		get_tree().change_scene("res://src/WinScreen.tscn")
