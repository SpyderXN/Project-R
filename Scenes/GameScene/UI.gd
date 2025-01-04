extends CanvasLayer

@onready var score_board = $Score
@onready var info: Label = $Info
@onready var pause: TouchScreenButton = $Pause
@onready var high_score = $HighScore


func _ready():
	high_score.text = "High Score: " + str(Globals.high_score)

func _process(_delta):
	update_score()
	
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
	

func update_score():
	score_board.text = str(Globals.score)
