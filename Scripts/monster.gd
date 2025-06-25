extends Area2D

@onready var sprite = $Nomnom
@onready var dialogue_label = $"../Dialogue/DialogueLabel"
@onready var dialogue_group = $"../Dialogue"

func _on_sandwich_dropped():
	sprite.texture = preload("res://Image/nomnom_hearts.png")
	dialogue_group.visible = true
