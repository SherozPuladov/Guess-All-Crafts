extends Node



signal advertisement_opened()
signal advertisement_closed()

signal player_rewarded()
signal reward_failed()



func _ready():
	Bridge.game.connect("visibility_state_changed", self, "_on_visibility_state_changed")
	Bridge.advertisement.connect("rewarded_state_changed", self, "_on_rewarded_state_changed")
	
	Bridge.advertisement.show_interstitial(true)
	Bridge.platform.send_message(Bridge.PlatformMessage.GAME_READY)


func _on_visibility_state_changed(state):
	match state:
		"visible":
			GameManager.resume_game()
		"hidden":
			GameManager.pause_game()


func show_advertisement_for_reward():
	Bridge.advertisement.show_rewarded()


func _on_rewarded_state_changed(state):
	match state:
		"opened":
			GameManager.pause_game()
		"closed":
			pass
		"failed":
			GameManager.notificate("REWARD_FAILED")
			emit_signal("reward_failed")
		"rewarded":
			GameManager.notificate("REWARDED")
			GameManager.replenish_lives()
			emit_signal("player_rewarded")

# Code by Sheroz Pulatov sherozpulatov3@gmail.com
