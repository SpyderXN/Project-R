extends CanvasLayer

@onready var score_board = $HBoxContainer/Score
@onready var info: Label = $Info
@onready var pause: TouchScreenButton = $Pause
@onready var high_score = $HBoxContainer/HighScore


func _ready():
	
	#TO DISPLAY UPDATED HIGH SCORE EVERY TIME THE GAME START
	high_score.text = "High Score: " + str(Globals.high_score)

func _process(_delta):
	
	#UPDATE SCORE EVERY FRAME
	update_score()


	#PLAYER FALLS FROM THE GROUND AND HIDE THE UI FROM TRANSITION
	if $"../Player".global_position.y >= 1000:
		score_board.visible = false
		info.visible = false
	else: 
		score_board.visible = true
		info.visible = true
	
	if $"../Player".global_position.y >= 1000:
		pause.visible = false
	else:
		pause.visible = true


	
	#RESTART BUTTON PRESSED TO RETRY THE RUN
	if Input.is_action_pressed("Restart"):
		Transiton.change_scene("res://Scenes/GameScene/game_scene.tscn")

func update_score():
	score_board.text = "Score: " + str(Globals.score)

