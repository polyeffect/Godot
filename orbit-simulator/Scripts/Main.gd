extends Node2D

@export var length:float = 200.0

@onready var sun = $Sun
@onready var planet = $Planet
@onready var planet2 = $Planet2

func _ready():
	sun.position = Vector2(500, 500)
	planet.position = sun.position + Vector2(length, 0)
	planet2.position = sun.position + Vector2(length+20, 0)
	
	var G = 10.0
	var r = 200
	var orbit_speed = sqrt(G * sun.mass/r)
	
	planet.velocity = Vector2(0, -orbit_speed)
	planet2.velocity = Vector2(0, -orbit_speed)
