extends Node2D

func _on_play_hg_pressed():
	get_tree().change_scene_to_file("res://Scenes/hand_gesture.tscn")

func _on_play_nom_nom_pressed():
	get_tree().change_scene_to_file("res://Scenes/asking_for_food.tscn")

func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _ready():
	$BackgroundMusic.play()
	$BackgroundMusic.connect("finished", Callable(self, "_on_music_finished"))

func _on_music_finished():
	$BackgroundMusic.play()
