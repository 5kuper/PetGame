extends CharacterBody2D

var approach_enabled := false

@export var active_distance := 300
@export var speed := 1000

@onready var _init_pos := position

func _physics_process(delta: float):
	var mouse_pos := get_viewport().get_mouse_position()
	var is_distance_fits := mouse_pos.distance_to(_init_pos) < active_distance
	
	if approach_enabled && is_distance_fits:
		var max_speed := position.distance_to(mouse_pos) / delta
		velocity = min(speed, max_speed) * position.direction_to(mouse_pos)
	else:
		var max_speed := position.distance_to(_init_pos) / delta
		velocity = min(speed, max_speed) * position.direction_to(_init_pos)
	
	move_and_slide()
