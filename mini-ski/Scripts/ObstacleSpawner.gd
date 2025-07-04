extends Node2D

const OBSTACLE_SCENES = [
	{ scene = preload("res://Scenes/Obstacles/TreeLarge.tscn"), weight = 3 },
	{ scene = preload("res://Scenes/Obstacles/TreeMedium.tscn"), weight = 3 },
	{ scene = preload("res://Scenes/Obstacles/TreeSmall.tscn"), weight = 3 },
	{ scene = preload("res://Scenes/Obstacles/Log1.tscn"), weight = 1 },
	{ scene = preload("res://Scenes/Obstacles/Log2.tscn"), weight = 1 }
]

@export var spawn_interval:float = 1.0
@export var scroll_speed:float = 100.0
var spawn_x_range:Vector2 = Vector2.ZERO

var timer:float = 0.0

func _ready():
	spawn_x_range = Vector2(0, get_viewport_rect().size.x)

func _process(delta):
	timer += delta
	if timer >= spawn_interval:
		timer = 0.0
		spawn_obstacle()
		
func spawn_obstacle():
	var scene = get_weight_obstacle()
	var obstacle = scene.instantiate()
	obstacle.position = Vector2(
		randf_range(spawn_x_range.x, spawn_x_range.y),
		get_viewport_rect().size.y + 64
	)
	obstacle.scroll_speed = scroll_speed
	add_child(obstacle)
	
func get_weight_obstacle():
	var pool:Array[PackedScene] = []
	for entry in OBSTACLE_SCENES:
		for i in entry.weight:
			pool.append(entry.scene)
	return pool.pick_random()
