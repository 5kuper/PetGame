extends Node2D

var shake_distance := 2
var shake_period := 0.08

func _ready():
	var tween := create_tween().set_loops()
	
	var p1 := Vector2(position.x + shake_distance, position.y + shake_distance)
	tween.tween_property(self, "position", p1, shake_period)
	var p2 := Vector2(position.x - shake_distance, position.y - shake_distance)
	tween.tween_property(self, "position", p2, shake_period)
