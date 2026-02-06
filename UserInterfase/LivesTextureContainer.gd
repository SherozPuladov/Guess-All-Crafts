extends HBoxContainer



var live_texture_packed_scene: PackedScene = preload("res://UserInterfase/Scenes/LiveTexture.tscn")



func _ready():
	GameManager.connect("lives_are_changed", self, "initiate_lives")
	initiate_lives()


func initiate_lives():
	for old_child in self.get_children():
		old_child.queue_free()
	
	for i in range(GameManager.lives):
		var live = live_texture_packed_scene.instance()
		self.add_child(live)

# Code by Sheroz Pulatov sherozpulatov3@gmail.com
