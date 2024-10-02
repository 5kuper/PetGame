extends Node

signal pressed()
signal mouse_entered()
signal mouse_exited()

signal happiness_updated(val: int)
var happiness := 100:
	set(val):
		happiness = val
		if (happiness < 0): happiness = 0
		if (happiness > 100): happiness = 100
		happiness_updated.emit(happiness)

signal satiety_updated(val: int)
var satiety := 100:
	set(val):
		satiety = val
		if (satiety < 0): satiety = 0
		if (satiety > 100): satiety = 100
		satiety_updated.emit(satiety)

func play():
	satiety -= 10
	happiness += 10

func feed(val: int):
	satiety += val

func need_wait_food(val: bool):
	$Appear.set_mouse_approach_enabled(val)

func need_open_mouth(val: bool):
	$Appear.need_open_mouth(val)

func _ready():
	var btn := $Appear/Body/Button
	btn.pressed.connect(func(): pressed.emit())
	btn.mouse_entered.connect(func(): mouse_entered.emit())
	btn.mouse_exited.connect(func(): mouse_exited.emit())

func _on_unhappy_timer_timeout():
	happiness -= 1
