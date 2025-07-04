extends Node

@onready var player = $"../Player"
@onready var score_label = $"../UI/ScoreLabel"
var score:float = 0
var last_y:float = 0.0

func _ready():
	player.connect("hit_obstacle", self._on_player_hit)
	
func _process(delta):
	score += player.SPEED * delta
	score_label.text = "SCORE: %d" % score
	
func _on_player_hit():
	print("Game Over!")
