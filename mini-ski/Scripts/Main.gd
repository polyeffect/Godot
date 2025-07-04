extends Node2D

@onready var player = $Player
@onready var snow_emitter = $SnowEmitter

func _ready():
	player.position = Vector2(get_viewport_rect().size.x / 2, 150)


func _process(_delta):
	snow_emitter.position = player.global_position
