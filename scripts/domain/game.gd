extends Node

signal coins_updated(val: int)
var coins := 0:
	set(val):
		coins = val
		coins_updated.emit(coins)

var _is_feeding_expected: bool

func _on_pet_pressed():
	if !_is_feeding_expected:
		coins += 1

func _on_food_selection_changed(is_food_selected):
	_is_feeding_expected = is_food_selected
