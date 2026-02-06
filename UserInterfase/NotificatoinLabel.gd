class_name NotificationLabel extends Label



func _ready():
	visible = false


func display_notification(str_text: String, inner_str: String = ""):
	text = str_text
	var formatted_text = text
	if "%s" in text:
		formatted_text = formatted_text.format(inner_str, "%s")
		text = formatted_text
		print("---")
		print(formatted_text)
	show()


func show():
	visible = true
	var tween = Tween.new()  # Создание нового объекта tween
	add_child(tween)  # Добавление tween в качестве дочернего объекта для управления им
	
	tween.interpolate_property(self, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)  # Использование interpolate_property для анимации modulate
	tween.interpolate_property(self, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 5)  # Добавление второй анимации
	
	tween.start()  # Запуск анимации
	tween.connect("tween_completed", self, "_hide_panel")  # Подключение сигнала завершения анимации к методу _hide_panel

func _hide_panel():
	visible = false
	queue_free()  # Освобождение ресурсов tween после завершения анимации

# Code by Sheroz Pulatov sherozpulatov3@gmail.com
