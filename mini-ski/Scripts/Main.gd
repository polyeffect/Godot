extends Node2D

@onready var player = $Player
@onready var snow_emitter = $SnowEmitter

func _ready():
	player.position = Vector2(get_viewport_rect().size.x / 2, 150)


func _process(_delta):
	snow_emitter.position = player.global_position
	var count = 0
	for node in get_tree().get_nodes_in_group("Obstacle"):
		if is_instance_valid(node):
			count += 1
	print("현재 장애물 수: ", count)
