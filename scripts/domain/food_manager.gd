extends Node

signal selection_changed(is_food_selected: bool)
signal readiness_changed(is_ready_to_feed: bool)

signal pet_feeding(val: int)

@export var _mouse_attaching_script: Script
@export var _shaking_script: Script

var _selected_food: Node2D

func select_food(sprite: Sprite2D):
	if _selected_food == null:
		_selected_food = Node2D.new()
		_selected_food.set_script(_mouse_attaching_script)
		
		var sprite_copy = sprite.duplicate() as Sprite2D
		sprite_copy.set_script(_shaking_script)
		sprite_copy.position = Vector2.ZERO
		sprite_copy.z_index = 1
		_selected_food.add_child(sprite_copy)

		add_child(_selected_food)
		selection_changed.emit(true)

func _on_pet_pressed():
	if _selected_food != null:
		pet_feeding.emit(10)
		readiness_changed.emit(false)
		
		_selected_food.free()
		selection_changed.emit(false)

func _on_pet_mouse_entered():
	if _selected_food != null:
		readiness_changed.emit(true)

func _on_pet_mouse_exited():
	if _selected_food != null:
		readiness_changed.emit(false)
