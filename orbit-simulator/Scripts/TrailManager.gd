extends Node2D

@export var trail_update_interval:int = 3
var frame_counter:int = 0
@export var max_points:int = 80
@export var trail_width:float = 1.5
@export var trail_color:Color = Color.CYAN

var trail_map:Dictionary = {}

func register_trail(planet:Node2D):
	var line = Line2D.new()
	line.width = trail_width
	line.default_color = trail_color
	var gradient:Gradient = Gradient.new()
	var r:float = randf_range(0.5, 1.0)
	var g:float = randf_range(0.5, 1.0)
	var b:float = randf_range(0.5, 1.0)
	gradient.colors = [
		Color(r, g, b, 0.0),
		Color(r, g, b, 0.5)
	]
	line.gradient = gradient
	line.antialiased = true
	add_child(line)
	trail_map[planet] = line

func _process(delta):
	frame_counter += 1
	if frame_counter % trail_update_interval != 0: return
	
	for body in trail_map.keys():
		if not is_instance_valid(body): continue
		
		var trail:Line2D = trail_map[body]
		trail.add_point(body.global_position)
		
		if trail.points.size() > max_points:
			trail.remove_point(0)
