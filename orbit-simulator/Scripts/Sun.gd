extends Node2D

@export var mass:float = 10000.0

func _draw():
	draw_circle(Vector2(0, 0), 50, Color.ORANGE_RED)
