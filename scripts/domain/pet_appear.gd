extends Node

@export var _idle_texture: Texture2D
@export var _feeding_texture: Texture2D

func set_mouse_approach_enabled(val: bool):
	$Body.approach_enabled = val

func need_open_mouth(val: bool):
	$Body/Sprite.texture = _feeding_texture if val else _idle_texture
