extends Node2D

# Saving some components from the scene to variables
@onready var dreaming_bubble = $DreamingBubble
@onready var dialog_bubble = $DialogBubble

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_switch_to_talking()

func _switch_to_talking():
	# Start with dialog bubble hidden
	dialog_bubble.visible = false

	# Change the animations for the mouth after 5 seconds 
	await get_tree().create_timer(5).timeout

	# Playing the talking audio
	$TalkingAudio.play() 

	# Changing the bubbles
	dialog_bubble.visible = true
	dreaming_bubble.visible = false

func _on_button_pressed() -> void:
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
		
