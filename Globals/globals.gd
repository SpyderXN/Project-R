extends Node

var total_score: int = 0
var score: int = 0
var speed: int = 0
var high_score: int = 0
const SAVE_PATH = "user://highscore.save"


func _ready():
	load_high_score()

### 🏆 **Score Management**

func add_score(value: int):
	score += value
	total_score = score
	print("Current Score: ", score)

func reset_score():
	score = 0
	#total_score = 0
	print("Score Reset")

func game_over():
	update_high_score()
	save_high_score()
	print("Game Over. Final Score: ", total_score)
	print("High Score: ", high_score)
	print("Save Path: ", SAVE_PATH)


### 📊 **High Score Management**

func update_high_score():
	if score > high_score:
		high_score = score
		print("New High Score: ", high_score)

func save_high_score():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_var(high_score)
		file.close()
		print("High score saved: ", high_score)
	else:
		print("Failed to save high score.")

func load_high_score():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		if file:
			high_score = file.get_var()
			file.close()
			print("High score loaded: ", high_score)
		else:
			print("Failed to load high score.")
	else:
		print("No high score found. Starting fresh.")
