extends StaticBody2D

func _process(_delta):
	if global_position.x <= -500:
		queue_free()


func _on_area_2d_body_entered(body):
	if "hit" in body:
		body.hit()
		Globals.game_over()
		Globals.reset_score()
