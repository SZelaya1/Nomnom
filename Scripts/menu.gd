extends Node2D

func _on_next_button_pressed() -> void:
		get_tree().change_scene_to_file("res://Scenes/nomnom_eats.tscn")
