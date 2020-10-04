extends KinematicBody2D
# Defines the player's movement abilites and collisions

const RUN_SPEED = 200
const JUMP_SPEED = -600
const GRAVITY = 1200

var _velocity = Vector2()
var _jumping = false
var _is_falling = false
var _landed = false
var _right
var _left
var _jump
var _down
var _screen_shake = false

onready var dancing = false
onready var movement = true



func _physics_process(delta):
	_get_input()
	_velocity.y += GRAVITY * delta

	
	

func _process(delta):
	
	if !is_on_floor() and _velocity.y > 0:
		_is_falling = true
		if _velocity.y > 600:
			_screen_shake = true
	
	if _is_falling and is_on_floor():
		_landed = true
	
	if _landed:
		_landed = false
		_is_falling = false
		$FootDust.emitting = true
		if _screen_shake:
			$Camera2D.shake()
			_screen_shake = false
	
	
	
	if _jumping and is_on_floor():
		_jumping = false
	_velocity = move_and_slide(_velocity, Vector2(0, -1))


func _get_input():
	_velocity.x = 0
	if movement == true:
		_right = Input.is_action_pressed("walk_right")
		_left = Input.is_action_pressed("walk_left")
		_jump = Input.is_action_just_pressed("jump")
		_down = Input.is_action_pressed("crouch")

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
			if dancing == false:
				_on_AnimatedSprite_animation_finished()


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation != "Standing":
		$AnimatedSprite.play("Standing")
