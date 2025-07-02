extends Node2D

@onready var player = $"../Player"

func _ready():
	player.connect("hit_obstacle", self._on_player_hit)
	
func _on_player_hit():
	print("Game Over!")
