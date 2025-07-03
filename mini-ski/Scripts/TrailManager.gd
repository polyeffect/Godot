extends Node

@onready var trail = $"../Trail"
@onready var player = $"../Player"

const TRAIL_ADD_DISTANCE = 0.0
@export var trail_update_interval:int = 2
@export var max_points:int = 30
var frame_counter:int = 0
var last_pos:Vector2 = Vector2.ZERO
var scroll_speed = 100.0
var timer:float = 0.0

func _ready():
	last_pos = player.position
	trail.clear_points()
	#trail.add_point(player.position)
	
func _process(delta):
	for i in range(trail.points.size()):
		var pos:Vector2 = trail.get_point_position(i)
		pos.y -= scroll_speed * delta
		trail.set_point_position(i, pos)
		
	frame_counter += 1
	if frame_counter % trail_update_interval != 0: return 
	
	trail.add_point(player.global_position)
	last_pos = player.position
	
	if trail.get_point_count() > max_points:
		trail.remove_point(0)
