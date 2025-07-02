extends Node2D

const OBSTACLE_SCENES = [
	preload("res://Scenes/Obstacles/TreeLarge.tscn"),
	preload("res://Scenes/Obstacles/TreeMedium.tscn"),
	preload("res://Scenes/Obstacles/TreeSmall.tscn")
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
	var scene = OBSTACLE_SCENES.pick_random()
	var obstacle = scene.instantiate()
	obstacle.position = Vector2(
		randf_range(spawn_x_range.x, spawn_x_range.y),
		get_viewport_rect().size.y + 32
	)
	obstacle.scroll_speed = scroll_speed
	add_child(obstacle)
