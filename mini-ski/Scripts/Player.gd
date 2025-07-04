extends Area2D

signal hit_obstacle

@onready var sprite = $Sprite2D
@onready var anim = $AnimationPlayer

const SPEED:float = 100.0
var is_moving:bool = false
var last_direction:int = 0 # -1: left, 1: right

func  _ready():
	connect("area_entered", self._on_area_entered)
	
func _process(delta):
	var input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if input < 0:
		if !is_moving or last_direction != -1:
			sprite.flip_h = true
			anim.play("side_move")
			is_moving = true
			last_direction = -1
		position.x += input * SPEED * delta
		
	elif input > 0:
		if !is_moving or last_direction != 1:
			sprite.flip_h = false
			anim.play("side_move")
			is_moving = true
			last_direction = 1
		position.x += input * SPEED * delta
		
	else:
		if is_moving:
			is_moving = false
			if last_direction == -1:
				sprite.flip_h = true
				anim.play("move_back")
			elif last_direction == 1:
				sprite.flip_h = false
				anim.play("move_back")
	
func _on_area_entered(area):
	if area.is_in_group("Obstacle"):
		hit_obstacle.emit()
