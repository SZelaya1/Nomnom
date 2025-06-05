extends Node2D


func _on_hand_gesture_pressed():
	get_tree().change_scene_to_file("res://hand-gesture.tscn")

func _on_nom_nom_pressed() -> void:
	get_tree().change_scene_to_file("")

func _on_quit_pressed() -> void:
	get_tree().quit()
