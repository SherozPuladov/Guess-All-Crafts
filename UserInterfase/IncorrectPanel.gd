class_name IncorrectPanel extends Panel

func _ready():
	visible = false

func show():
	visible = true
	var tween = Tween.new()  # Создание нового объекта tween
	add_child(tween)  # Добавление tween в качестве дочернего объекта для управления им
	
	tween.interpolate_property(self, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 0.3), 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)  # Использование interpolate_property для анимации modulate
	tween.interpolate_property(self, "modulate", Color(1, 1, 1, 0.3), Color(1, 1, 1, 0), 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 0.5)  # Добавление второй анимации
	
	tween.start()  # Запуск анимации
	tween.connect("tween_completed", self, "_hide_panel")  # Подключение сигнала завершения анимации к методу _hide_panel

func _hide_panel():
	visible = false
	queue_free()  # Освобождение ресурсов tween после завершения анимации

# Code by Sheroz Pulatov sherozpulatov3@gmail.com
