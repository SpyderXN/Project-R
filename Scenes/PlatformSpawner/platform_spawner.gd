extends Node2D

var ground = preload("res://Scenes/Ground/ground.tscn")
@onready var timer = $Timer

var can_spawn = true

func _ready():
	var platforms = ground.instantiate() as StaticBody2D
	platforms.position.y = randf_range(500,700)
	#platforms.position.x = randf_range(0, 500)

func _process(_delta):
	if can_spawn:
		can_spawn = false
		var platforms = ground.instantiate() as StaticBody2D
		platforms.position.y = randf_range(500,700)
		$Timer.start()
		$Platforms.add_child(platforms)
	
	adjust_spawn_rate()


func _on_timer_timeout():
	can_spawn = true


func adjust_spawn_rate():
	# Example: Timer decreases as speed increases
	# Assuming 'Globals.speed' holds the current speed
	var base_speed = 350  # Starting speed
	var base_wait_time = 2.7  # Starting spawn rate
	
	# Dynamically adjust wait time based on speed
	timer.wait_time = max(0.5, base_wait_time - (Globals.speed - base_speed) * 0.001)
