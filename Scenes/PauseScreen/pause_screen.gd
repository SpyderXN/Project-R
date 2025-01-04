extends Control



func _process(_delta):
	escape()


func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")

func escape():
	if Input.is_action_just_pressed("Pause") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("Pause") and get_tree().paused == true:
		resume()

func _on_resume_pressed():
	resume()


func _on_restart_pressed():
	resume()
	Transiton.change_scene("res://Scenes/GameScene/game_scene.tscn")


func _on_home_pressed():
	resume()
	Transiton.change_scene("res://Scenes/HomeScreen/home_screen.tscn")
