extends Control


@onready var total_score = $PanelContainer/VBoxContainer/TotalScore
@onready var high_score = $PanelContainer/VBoxContainer/HighScore


func _ready():
	total_score.text = "Score: " + str(Globals.total_score)
	high_score.text = "High score: " + str(Globals.high_score)


func _on_retry_pressed():
	Transiton.change_scene("res://Scenes/GameScene/game_scene.tscn")


func _on_home_pressed():
	Transiton.change_scene("res://Scenes/HomeScreen/home_screen.tscn")


func _on_exit_pressed():
	get_tree().quit()


func _on_retry_touch_pressed():
	Transiton.change_scene("res://Scenes/GameScene/game_scene.tscn")


func _on_home_touch_pressed():
	Transiton.change_scene("res://Scenes/HomeScreen/home_screen.tscn")


func _on_exit_touch_pressed():
	get_tree().quit()
