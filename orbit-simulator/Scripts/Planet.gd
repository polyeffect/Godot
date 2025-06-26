extends Node2D

var mass:float = 10.0
var velocity:Vector2 = Vector2.ZERO
var acceleration:Vector2 = Vector2.ZERO

func _draw():
	draw_circle(Vector2(0, 0), 10, Color.GREEN)

func apply_force(force:Vector2):
	acceleration += force / mass
	
func update_motion(delta:float):
	velocity += acceleration * delta
	position += velocity * delta
	acceleration = Vector2.ZERO
