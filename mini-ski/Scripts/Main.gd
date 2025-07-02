extends Node2D

@onready var player = $Player

func _ready():
	player.position = Vector2(get_viewport_rect().size.x / 2, 150)
