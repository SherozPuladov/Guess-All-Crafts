class_name CraftPortal extends Area

signal craft_selected(is_correct)

export var is_correct : bool = false

func body_entered(_body):
	emit_signal("craft_selected", is_correct)

# Code by Sheroz Pulatov sherozpulatov3@gmail.com
