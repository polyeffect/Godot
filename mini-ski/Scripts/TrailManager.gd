extends Node

@onready var trail = $"../Trail"
@onready var muffler = $"../Muffler"
@onready var player = $"../Player"

const TRAIL_ADD_DISTANCE = 0.0
@export var trail_update_interval:int = 2
@export var trail_max_points:int = 100
@export var muffler_max_points:int = 10
var frame_counter:int = 0
var last_pos:Vector2 = Vector2.ZERO
var scroll_speed = 100.0
var timer:float = 0.0

func _ready():
	last_pos = player.position
	trail.clear_points()
	muffler.clear_points()
	#trail.add_point(player.position)
	
func _process(delta):
	for i in range(trail.points.size()):
		var pos:Vector2 = trail.get_point_position(i)
		pos.y -= scroll_speed * delta
		trail.set_point_position(i, pos)
		
	for j in range(muffler.points.size()):
		var pos:Vector2 = muffler.get_point_position(j)
		pos.y -= scroll_speed * delta
		muffler.set_point_position(j, pos)
		
	frame_counter += 1
	if frame_counter % trail_update_interval != 0: return 
	
	var player_global_pos = player.global_position
	var offset_x = randf_range(-1.5, 1.5)
	trail.add_point(player_global_pos)
	muffler.add_point(player_global_pos + Vector2(offset_x, 0))
	last_pos = player.position
	
	if trail.get_point_count() > trail_max_points:
		trail.remove_point(0)
		
	if muffler.get_point_count() > muffler_max_points:
		muffler.remove_point(0)
