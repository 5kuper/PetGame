extends BaseButton

signal pressed_holding(node: Node)
@export var _holded_node: Node

func _ready():
	pressed.connect(func(): pressed_holding.emit(_holded_node))
