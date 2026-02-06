extends TextureRect


func _ready():
	rect_scale = Vector2(0, 0)
	var tween = create_tween()
	tween.tween_property(self, "rect_scale", Vector2(1, 1), 0.5).from(Vector2(0, 0))
