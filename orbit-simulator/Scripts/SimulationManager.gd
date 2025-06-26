extends Node

@onready var sun = get_node("../Sun")
@onready var planet = get_node("../Planet")

@export var time_scale:float = 5.0
var G:float = 10.0

func _physics_process(delta:float):
	var scaled_delta = delta * time_scale
	
	var r_vector = planet.position - sun.position
	var r = r_vector.length()
	
	if r < 1.0:
		return
		
	var force_mag = G * sun.mass * planet.mass / (r * r)
	var force = -r_vector.normalized() * force_mag
	
	planet.apply_force(force)
	planet.update_motion(scaled_delta)
	
