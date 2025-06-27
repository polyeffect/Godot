extends Node2D

var mass:float = 2.0
var velocity:Vector2 = Vector2.ZERO
var acceleration:Vector2 = Vector2.ZERO
var planet_color = Color.from_hsv(randf_range(0.15, 0.25), 1.0, 1.0)

func _ready():
	mass = randi_range(1, 3)

func _draw():
	draw_circle(Vector2(0, 0), mass, planet_color)

func apply_force(force:Vector2):
	acceleration += force / mass
	
func update_motion(delta:float):
	velocity += acceleration * delta
	position += velocity * delta
	acceleration = Vector2.ZERO
