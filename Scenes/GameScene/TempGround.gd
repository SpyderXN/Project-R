extends StaticBody2D




func _on_area_2d_body_entered(body):
	if(body.name == "Ground"):
		queue_free()
