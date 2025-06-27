extends Node2D

@onready var sun = $Sun
@onready var simulation_manager = $SimulationManager
@onready var trail_manager = $TrailManager
@export var planet_scene:PackedScene = preload("res://Scenes/Planet.tscn")
@export var comet_scene:PackedScene = preload("res://Scenes/Comet.tscn")

func _ready():
	sun.position = Vector2(500, 500)
		
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			create_planet(event.position)
		
		if event.button_index == MOUSE_BUTTON_RIGHT:
			create_comet(event.position)
				
func create_planet(position:Vector2):
	var p = planet_scene.instantiate()
	p.position = position
	
	var r_vec = position - sun.position
	var r = r_vec.length()
	if r < 1.0: return
	
	var v_mag = sqrt(simulation_manager.G * sun.mass / r)
	#var v_mag = 20
	var v_dir = r_vec.normalized().orthogonal()
	p.velocity = v_dir * v_mag
	
	add_child(p)
	simulation_manager.register_planet(p)
	trail_manager.register_trail(p)
	
func create_comet(position:Vector2):
	var c = comet_scene.instantiate()
	c.position = position
	
	var r_vec = position - sun.position
	var r = r_vec.length()
	if r < 1.0: return
	
	var orbit_speed = sqrt(simulation_manager.G * sun.mass / r)
	var v_mag = orbit_speed * randf_range(0.4, 0.7)
	var v_dir = r_vec.normalized().orthogonal().rotated(deg_to_rad(randf_range(-30, 30)))
	c.velocity = v_dir * v_mag
	
	add_child(c)
	simulation_manager.register_planet(c)
	trail_manager.register_trail(c)
