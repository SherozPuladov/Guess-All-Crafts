extends Spatial


onready var pause_panel : Panel = $LevelUI/PausePanel
const INVISIBLE_CURSOR_REF: String = "res://UserInterfase/Textures/invisible_cursor.webp"
const DEBUG_INVISIBLE_CURSOR_REF: String = "res://UserInterfase/Textures/debug_invisible_cursor.png"


func _ready():
	pause_game()
	GameManager.connect("player_winned", self, "_player_winned")


func _input(event):
	if Input.is_action_just_pressed("show_reward_advertisement"):
		BridgeManager.show_advertisement_for_reward()
	
	if Input.is_action_just_pressed("ui_cancel") or Input.is_action_just_pressed("ui_accept"):
		if get_tree().paused == false:
			pause_game()
		else:
			resume_game()
	
	if Input.is_action_just_pressed("show_mouse"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func pause_game():
	get_tree().paused = true
	pause_panel.visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	Bridge.platform.send_message(Bridge.PlatformMessage.GAMEPLAY_STOPPED)
	Input.set_custom_mouse_cursor(null, Input.CURSOR_ARROW)


func resume_game():
	get_tree().paused = false
	pause_panel.visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Bridge.platform.send_message(Bridge.PlatformMessage.GAMEPLAY_STARTED)
	Input.set_custom_mouse_cursor(load(INVISIBLE_CURSOR_REF), Input.CURSOR_ARROW)
	
	if !GameManager.is_instruction_was_shown:
		GameManager.notificate("PAUSE_GAME_DESKTOP_INSTRUCTION")
		GameManager.is_instruction_was_shown = true


func _player_winned():
	$Cubes/Bracing.queue_free()
	$Cubes/Bracing2.queue_free()
	$Cubes/Cake.visible = true

# Code by Sheroz Pulatov sherozpulatov3@gmail.com
