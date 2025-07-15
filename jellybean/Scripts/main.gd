extends Node3D


@onready var jellybean_scene = preload("res://Scenes/Jellybean.tscn")
@onready var camera = $Camera3D
@export var spawn_depth = 0.0
@export var spawn_height = 5.0

func _input(event):
	if event is InputEventScreenTouch and event.pressed:
		print("Touch")
	elif event is InputEventMouseButton and event.pressed:
		print("Click")
		spawn_jellybean_at_screen(event.position)

func spawn_jellybean_at_screen(screen_pos:Vector2):
	var origin = camera.project_ray_origin(screen_pos)
	var direction = camera.project_ray_normal(screen_pos)
	
	var distance = (spawn_depth - origin.z) / direction.z
	var position = origin + direction * distance
	
	position.y = spawn_height
	
	spawn_jellybean(position)

func spawn_jellybean(pos:Vector3):
	var jb = jellybean_scene.instantiate()
	jb.position = pos
	add_child(jb)
