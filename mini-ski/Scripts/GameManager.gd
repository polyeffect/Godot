extends Node

@onready var player = $"../Player"
@onready var score_label = $"../UI/ScoreLabel"
@onready var start_label = $"../UI/Start"
@onready var restart_label = $"../UI/Restart"
var score:float = 0
var last_y:float = 0.0
var game_started = false
var game_paused = true

func _ready():
	get_tree().paused = true
	start_label.show()
	restart_label.hide()
	player.connect("hit_obstacle", self._on_player_hit)
	
func _process(delta):
	if game_paused and !game_started:
		if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
			print("press button")
			_start_game()
	elif game_paused and game_started:
		if Input.is_action_just_pressed("ui_accept"):
			_restart_game()
	else:
		score += player.SPEED * delta
		score_label.text = "SCORE: %d" % score
	
func _start_game():
	get_tree().paused = false
	game_started = true
	game_paused = false
	start_label.hide()
	restart_label.hide()
	print("Game Start!")
	
func _restart_game():
	get_tree().reload_current_scene()
	
func _on_player_hit():
	get_tree().paused = true
	game_paused = true
	restart_label.show()
	print("Game Over!")
