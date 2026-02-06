class_name CraftsManager extends Node



signal correct_craft_selected
signal incorrect_craft_selected



export(Array, Resource) var crafts



onready var progress_bar : ProgressBar = $"../LevelUI/MainPanel/ProgressBar"

onready var cake: Spatial = $"../Cubes/Cake"

onready var left_portal : CraftPortal = $"../Cubes/Bracing/LeftPortal"
onready var right_portal : CraftPortal = $"../Cubes/Bracing2/RightPortal"

onready var left_portal_banner : Sprite3D = $"../Cubes/Bracing/LeftPortalBanner"
onready var right_portal_banner : Sprite3D = $"../Cubes/Bracing2/RightPortalBanner"

onready var player : Spatial = $"../Player"

onready var incorrect_panel: IncorrectPanel = $"../LevelUI/IncorrectPanel"



var current_craft_index : int = 99



func _ready():
	left_portal.connect("craft_selected", self, "change_craft_to")
	right_portal.connect("craft_selected", self, "change_craft_to")
	
	connect("correct_craft_selected", $"../AudioManager", "play_correct_craft_audio")
	connect("incorrect_craft_selected", $"../AudioManager", "play_incorrect_craft_audio")
	
	progress_bar.max_value = crafts.size()
	progress_bar.value = current_craft_index
	
	_initiate()


func _initiate() -> void:
	randomize()
	var random_num = randi() % 2
	
	if random_num == 0:
		left_portal.is_correct = true
		right_portal.is_correct = false
		left_portal_banner.texture = crafts[current_craft_index].correct
		right_portal_banner.texture = crafts[current_craft_index].incorrect
	else:
		left_portal.is_correct = false
		right_portal.is_correct = true
		left_portal_banner.texture = crafts[current_craft_index].incorrect
		right_portal_banner.texture = crafts[current_craft_index].correct


func change_craft_to(is_correct: bool) -> void:
	if is_correct:
		emit_signal("correct_craft_selected")
		current_craft_index = get_next_correct_craft_index()
	else:
		GameManager.lives = GameManager.lives - 1
		emit_signal("incorrect_craft_selected")
		current_craft_index = get_next_incorrect_craft_index()
		incorrect_panel.show()
	
	if current_craft_index < crafts.size():
		_initiate()
	else:
		GameManager._player_winned()
	
	player.translation.z += 22
	progress_bar.value = current_craft_index


func get_next_correct_craft_index() -> int:
	GameManager.notificate(str(current_craft_index + 1))
	return (current_craft_index + 1)


func get_next_incorrect_craft_index() -> int:
	if GameManager.lives > 0:
		if current_craft_index > 9:
			var back_to = int(ceil(current_craft_index / 5))
			GameManager.notificate("INCORRECT_NOTIFICATION", str(back_to))
			return (current_craft_index - back_to)
		else:
			return 0
	else:
#		GameManager.lives_are_over()
		return 0

# Code by Sheroz Pulatov sherozpulatov3@gmail.com
