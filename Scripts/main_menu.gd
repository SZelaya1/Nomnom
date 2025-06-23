extends Node2D

func _on_hand_gesture_pressed():
	get_tree().change_scene_to_file("res://Scenes/hand_gesture.tscn")

func _on_nom_nom_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/asking_for_food.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
