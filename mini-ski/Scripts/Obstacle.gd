extends Area2D

@export var scroll_speed:float = 100.0

func _ready():
	add_to_group("Obstacle")
	
func _process(delta):
	position.y -= scroll_speed * delta
	if position.y < -64:
		queue_free()
