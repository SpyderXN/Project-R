extends StaticBody2D


func _on_area_2d_body_entered(body):
	if "hit" in body:
		body.hit()
		Globals.game_over()
		Globals.reset_score()
