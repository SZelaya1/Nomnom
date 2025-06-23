extends Node2D

func _on_quit_pressed():
	get_tree().quit()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/select_game.tscn")

func _ready():
	$BackgroundMusic_Main.play()
	$BackgroundMusic_Main.connect("finished", Callable(self, "_on_music_finished"))

func _on_music_finished():
	$BackgroundMusic_Main.play()
