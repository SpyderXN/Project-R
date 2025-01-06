extends StaticBody2D

var direction = Vector2.LEFT

var drums = preload("res://Scenes/SteelDrums/steel_drums.tscn")
var oil_drums = preload("res://Scenes/OilDrums/oil_drums.tscn")


@export var speed: int

func _ready():
	randomize()
	spawn_object()
	spawn_oil()

func _process(delta):
	
	position += direction * speed * delta 
	
	if(position.x <= -4000):
		queue_free()
	
	# Increase speed by 2 for every 5 points scored
	speed = 350 + (Globals.score / 15) * 50
	
	#To keep track of the speed in globals
	Globals.speed = speed

func _on_area_2d_body_exited(body):
	if (body.name == "Player"):
		Globals.add_score(1)

func spawn_object():
	if drums:
		var spawn = drums.instantiate() as StaticBody2D
		$Collection.add_child(spawn)
		spawn.position = Vector2(randf_range(70, 270), -138)

func spawn_oil():
	if oil_drums:
		var spawn_oil_drum = oil_drums.instantiate() as StaticBody2D
		$OilDrums.add_child(spawn_oil_drum)
		spawn_oil_drum.position = Vector2(randf_range(-350, -240), -138)
