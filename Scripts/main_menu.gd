extends Node2D

func _on_quit_pressed():
	UiButtonAudio.play_close()
	await get_tree().create_timer(0.3).timeout
	get_tree().quit()

func _on_play_pressed():
	UiButtonAudio.play_click()
	get_tree().change_scene_to_file("res://Scenes/select_game.tscn")

func _ready():
	AudioManagerMain.play_music("res://Assets/Audios/main_music.wav")
	
	if AudioManagerCooking.has_method("stop_music"):
		AudioManagerCooking.stop_music()
