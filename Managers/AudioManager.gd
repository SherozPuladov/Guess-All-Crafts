class_name AudioManager extends Node



onready var ambient_audio_player : AudioStreamPlayer = $AmbientAudioPlayer
onready var correct_craft_audio_player : AudioStreamPlayer = $CorrectCraftAudioPlayer
onready var incorrect_craft_audio_player : AudioStreamPlayer = $IncorrectCraftAudioPlayer
onready var rewarded_audio_player: AudioStreamPlayer = $RewardedAudioPlayer
onready var reward_failed_audio_player: AudioStreamPlayer = $RewardFailedAudioPlayer
onready var lives_are_over_audio_player: AudioStreamPlayer = $LivesAreOverAudioPlayer
onready var player_winned_audio_player: AudioStreamPlayer = $PlayerWinnedAudioPlayer



func _ready():
	play_ambient_audio()
	GameManager.connect("player_winned", self, "play_player_winned_audio")
	GameManager.connect("lives_are_over", self, "play_lives_are_over_audio")
	BridgeManager.connect("player_rewarded", self, "play_rewarded_audio")
	BridgeManager.connect("reward_failed", self, "play_reward_failed_audio")


func play_ambient_audio():
	ambient_audio_player.playing = true


func play_correct_craft_audio():
	correct_craft_audio_player.playing = true


func play_incorrect_craft_audio():
	incorrect_craft_audio_player.playing = true


func play_rewarded_audio():
	rewarded_audio_player.playing = true


func play_reward_failed_audio():
	reward_failed_audio_player.playing = true


func play_lives_are_over_audio():
	lives_are_over_audio_player.playing = true


func play_player_winned_audio():
	player_winned_audio_player.playing = true

# Code by Sheroz Pulatov sherozpulatov3@gmail.com
