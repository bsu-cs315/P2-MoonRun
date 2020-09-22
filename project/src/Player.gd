extends KinematicBody2D
export (int) var run_speed = 100
export (int) var jump_speed = -400
export (int) var gravity = 1200

var velocity = Vector2()
var jumping = false


func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_select')
	var down = Input.is_action_pressed("ui_down")

	if jump and is_on_floor():
		jumping = true
		$AnimatedSprite.play("Jumping")
		velocity.y = jump_speed

	elif right:
		velocity.x += run_speed
		if is_on_floor():
			$AnimatedSprite.play("Walking")
			$AnimatedSprite.flip_h = false
	elif left:
		velocity.x -= run_speed
		if is_on_floor():
			$AnimatedSprite.play("Walking")
			$AnimatedSprite.flip_h = true
	elif down and is_on_floor():
		$AnimatedSprite.play("Down")
	else:
		_on_AnimatedSprite_animation_finished()


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation != 'Standing':
		$AnimatedSprite.play('Standing')


func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, -1))
