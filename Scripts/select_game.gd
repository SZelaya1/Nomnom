extends Node2D

# Loading video tutorials
var video1 = preload("res://Assets/Videos/Tutorial1.ogv")
var video2 = preload("res://Assets/Videos/Tutorial2.ogv")

func _on_play_hg_pressed():
	UiButtonAudio.play_click()
	get_tree().change_scene_to_file("res://Scenes/hand_gesture.tscn")

func _on_play_nom_nom_pressed():
	UiButtonAudio.play_click()
	get_tree().change_scene_to_file("res://Scenes/asking_for_food.tscn")

func _on_exit_button_pressed():
	UiButtonAudio.play_close()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_tutorial_hg_pressed():
	UiButtonAudio.play_tutorial()
	$Close_Tutorial.visible = true
	$TutorialVideo.visible = true
	$TutorialVideo.stream = video1
	$TutorialVideo.play()

func _on_tutorial_nom_nom_pressed():
	UiButtonAudio.play_tutorial()
	$Close_Tutorial.visible = true
	$TutorialVideo.visible = true
	$TutorialVideo.stream = video2
	$TutorialVideo.play()

func _on_close_tutorial_pressed():
	UiButtonAudio.play_close()
	$TutorialVideo.visible = false
	$TutorialVideo.stop()
	$Close_Tutorial.visible = false

func _ready():
	AudioManagerMain.play_music("res://Assets/Audios/main_music.wav")
