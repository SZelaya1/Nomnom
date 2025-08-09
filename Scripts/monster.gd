extends Area2D

@onready var sprite = $Nomnom
@onready var dialogue_label = $"../Dialogue/DialogueLabel"
@onready var dialogue_group = $"../Dialogue"
@onready var end_button = $"../TextureButton"

func _on_sandwich_dropped():
	sprite.texture = preload("res://Image/nomnom_hearts.png")
	dialogue_group.visible = true
	end_button.visible = true
	$YaySound.play()

func _on_end_button_pressed():
	UiButtonAudio.play_close()
	get_tree().change_scene_to_file("res://Scenes/select_game.tscn")
