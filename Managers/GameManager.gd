extends Node



signal player_winned()
signal lives_are_changed()
signal lives_are_over()



export var lives: int = 3 setget set_lives
func set_lives(value):
	lives = value
	if value <= 0:
		emit_signal("lives_are_over")
		notificate("LIVES_ARE_OVER")
	emit_signal("lives_are_changed")


var main_scene
var notification_l : NotificationLabel

var is_instruction_was_shown = false


func _ready():
	main_scene = get_tree().get_nodes_in_group("Level")[0]  # Получить сцену "L_Main"
	notification_l = get_tree().get_nodes_in_group("NotificationLabel")[0] # Получить Label "NotificationLabel"


# Жизни закончились
#func lives_are_over():
#	print("LIVES ARE OVER")


# Пополнить жизни
func replenish_lives():
	set_lives(3)


func _player_winned():
#	GameManager.notificate("CONGRATULATIONS")
	emit_signal("player_winned")
	GameManager.notificate("CREDITS")


func pause_game():
	main_scene.call("pause_game")  # Вызвать функцию "pause_game" в сцене "L_Main"

func resume_game():
	main_scene.call("resume_game") # Вызвать функцию "resume_game" в сцене "L_Main"


func notificate(str_text: String, inner_str: String = ""):
	notification_l.display_notification(str_text, inner_str)

# Code by Sheroz Pulatov sherozpulatov3@gmail.com
