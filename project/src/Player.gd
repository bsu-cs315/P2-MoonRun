extends KinematicBody2D
# Defines the player's movement abilites and collisions

const RUN_SPEED = 200
const JUMP_SPEED = -600
const GRAVITY = 1200

var _velocity = Vector2()
var _jumping = false


func _physics_process(delta):
	_get_input()
	_velocity.y += GRAVITY * delta
	
	if _jumping and is_on_floor():
		_jumping = false
	_velocity = move_and_slide(_velocity, Vector2(0, -1))


func _get_input():
	_velocity.x = 0
	var _right = Input.is_action_pressed("ui_right")
	var _left = Input.is_action_pressed("ui_left")
	var _jump = Input.is_action_just_pressed("ui_select")
	var _down = Input.is_action_pressed("ui_down")

	if _jump and is_on_floor():
		_jumping = true
		$AnimatedSprite.play("Jumping")
		_velocity.y = JUMP_SPEED

	elif _right:
		_velocity.x += RUN_SPEED
		if is_on_floor():
			$AnimatedSprite.play("Walking")
			$AnimatedSprite.flip_h = false
			
	elif _left:
		_velocity.x -= RUN_SPEED
		if is_on_floor():
			$AnimatedSprite.play("Walking")
			$AnimatedSprite.flip_h = true
			
	elif _down and is_on_floor():
		$AnimatedSprite.play("Down")
		
	else:
		_on_AnimatedSprite_animation_finished()


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation != "Standing":
		$AnimatedSprite.play("Standing")
