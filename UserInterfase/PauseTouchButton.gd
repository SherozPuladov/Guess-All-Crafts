extends Button


func _ready():
	if Bridge.device.type != "desktop":
		visible = true
	else:
		visible = false


func _pressed():
	GameManager.pause_game()
