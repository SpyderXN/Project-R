extends Area2D

var direction = Vector2.LEFT

@export var speed = 10

func _process(delta):
	
	position += direction * speed * delta 
	
	if(position.x <= -1000):
		queue_free()
