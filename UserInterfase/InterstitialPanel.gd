extends Panel


onready var timer_label: Label = $TimerLabel
onready var advertisement_timer: Timer = $AdvertisementTimer
onready var wait_timer_1: Timer = $WaitTimer1
onready var wait_timer_2: Timer = $WaitTimer2
onready var wait_timer_3: Timer = $WaitTimer3


func _ready():
	visible = false
	
	Bridge.advertisement.connect("interstitial_state_changed", self, "_on_interstitial_state_changed")
	
	advertisement_timer.connect("timeout", self, "_show_interstitial_advertisement")
	wait_timer_1.connect("timeout", self, "_on_wait_timer_1_timeout")
	wait_timer_2.connect("timeout", self, "_on_wait_timer_2_timeout")
	wait_timer_3.connect("timeout", self, "_on_wait_timer_3_timeout")
	
	advertisement_timer.start()


func _show_interstitial_advertisement():
	visible = true
	timer_label.text = "ADVERTISEMENT_AFTER_3_SEC"
	wait_timer_1.start()


func _on_wait_timer_1_timeout():
	timer_label.text = "ADVERTISEMENT_AFTER_2_SEC"
	wait_timer_2.start()


func _on_wait_timer_2_timeout():
	timer_label.text = "ADVERTISEMENT_AFTER_1_SEC"
	wait_timer_3.start()


func _on_wait_timer_3_timeout():
	timer_label.text = "ADVERTISEMENT_AFTER_0_SEC"
	Bridge.advertisement.show_interstitial()
	GameManager.pause_game()
	advertisement_timer.start()
	visible = false


func _on_interstitial_state_changed(state):
	match state:
		"loading":
#			GameManager.notificate("INTERSTITIAL_LOADING")
#			GameManager.pause_game()
			pass
		"shown":
			GameManager.notificate("INTERSTITIAL_SHOWN")
		"hidden":
			GameManager.notificate("INTERSTITIAL_HIDDEN")
		"failed":
			GameManager.notificate("INTERSTITIAL_FAILED")

# Code by Sheroz Pulatov sherozpulatov3@gmail.com
