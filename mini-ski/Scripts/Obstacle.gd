extends Area2D

@export var scroll_speed:float = 0
@export var max_speed:float = 150.0
@export var min_speed:float = 20.0

func _ready():
	add_to_group("Obstacle")
	
func _process(delta):
	var y_pos = global_position.y
	var speed = get_scroll_speed(y_pos)
	#global_position.y -= scroll_speed * delta
	global_position.y -= speed * delta
	if position.y < -64:
		queue_free()
		
func get_scroll_speed(y_pos:float) -> float:
	var screen_height = get_viewport().get_visible_rect().size.y
	var t = clamp(1 - (y_pos / screen_height), 0.4, 1)
	var factor = pow(t, 2)
	return lerp(max_speed, min_speed, factor)
