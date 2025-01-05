extends CharacterBody2D


@export var GRAVITY = 0
@export var JUMP_FORCE = 0
@export var JUMP_BUFFER_TIME = 0
@export var COYOTE_TIME = 0

@onready var animation_player = $AnimationPlayer

var JUMP_BUFFER_COUNTER = 0
var COYOTE_COUNTER = 0

var pressed = false

func _physics_process(_delta):
	if is_on_floor():
		COYOTE_COUNTER = COYOTE_TIME
		$AnimationPlayer.play("slime_run_2")
	
	# Add the gravity.
	if not is_on_floor():
		if COYOTE_COUNTER > 0:
			COYOTE_COUNTER -= 1
		
		velocity.y += GRAVITY
		if velocity.y > 2000:
			velocity.y = 2000
	
	if Input.is_action_just_pressed("Jump"):
		JUMP_BUFFER_COUNTER = JUMP_BUFFER_TIME
		$AnimationPlayer.play("slime_jump")
	
	if JUMP_BUFFER_COUNTER > 0:
		JUMP_BUFFER_COUNTER -= 1
	
	if JUMP_BUFFER_COUNTER > 0 and COYOTE_COUNTER > 0:
		velocity.y = -JUMP_FORCE
		JUMP_BUFFER_COUNTER = 0
		COYOTE_COUNTER = 0
	
	if Input.is_action_just_released("Jump"):
		if velocity.y < 0:
			velocity.y += 400

	move_and_slide()
	
	if position.y >= 1000:
		Globals.game_over()
		Globals.reset_score()
		Transiton.change_scene("res://Scenes/GameOver/game_over.tscn")

func hit():
	visible = false
	Transiton.change_scene("res://Scenes/GameOver/game_over.tscn")
