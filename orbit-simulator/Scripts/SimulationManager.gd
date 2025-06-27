extends Node

@export var G:float = 10.0
@export var time_scale:float = 5.0

var sun:Node2D
var planets:Array = []
var comets:Array = []

func _ready():
	sun = get_node("../Sun")
	
func _physics_process(delta:float):
	var scaled_delta = delta * time_scale
	
	# planets
	# sun - planet
	for planet in planets:
		var r_vec = planet.position - sun.position
		var r = r_vec.length()
		if r < 1.0: continue
		
		var f_mag = G * sun.mass * planet.mass / (r * r)
		var force = -r_vec.normalized() * f_mag
		planet.apply_force(force)
		
	# planet - planet
	for i in range(planets.size()):
		for j in range(i + 1, planets.size()):
			var p1 = planets[i]
			var p2 = planets[j]
			apply_gravity(p1, p2)
			
	for planet in planets:
		planet.update_motion(scaled_delta)
		
	# comets
	# sun - comet
	for comet in comets:
		var r_vec = comet.position - sun.position
		var r = r_vec.length()
		if r < 1.0: return
		
		var f_mag = G * sun.mass * comet.mass / (r * r)
		var force = -r_vec.normalized() * f_mag
		comet.apply_force(force)
		
	# comet - planet
	for i in range(comets.size()):
		for j in range(0, planets.size()):
			var c = comets[i]
			var p = planets[j]
			apply_gravity(c, p)
			
	for comet in comets:
		comet.update_motion(scaled_delta)

func apply_gravity(body_a, body_b):
	var r_vec = body_b.position - body_a.position
	var r = r_vec.length()
	if r < 1.0: return
	var f_mag = G * body_a.mass * body_b.mass / (r * r)
	var f = r_vec.normalized() * f_mag
	body_a.apply_force(f)
	body_b.apply_force(-f)

func register_planet(p:Node2D):
	planets.append(p)
	
func register_comet(p:Node2D):
	comets.append(p)
