extends Node2D

var is_paused = false

func _process(_delta):
	if Input.is_action_pressed("Pause"):
		get_tree().paused = true


func _on_play_pressed():
	Transiton.change_scene("res://Scenes/GameScene/game_scene.tscn")


func _on_exit_pressed():
	get_tree().quit()



func _on_start_pressed():
	Transiton.change_scene("res://Scenes/GameScene/game_scene.tscn")


func _on_quit_pressed():
	get_tree().quit()
