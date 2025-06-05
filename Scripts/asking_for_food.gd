extends Node2D

# Saving some components from the scene to variables
@onready var monster = $MonsterBody3
@onready var dreaming_bubble = $DreamingBubble
@onready var dialog_bubble = $DialogBubble

# Saving the monster's mouth
@onready var monster_mouth = $MonsterBody3/MonsterMouth

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_switch_to_talking()

func _switch_to_talking():
	# Start with dialog bubble hidden
	dialog_bubble.visible = false
	
	# Play the idle animation on all eyes
	for eye in get_eyes(monster):
		eye.play("idle")

	# Change the animations for the mouth after 5 seconds 
	await get_tree().create_timer(5).timeout
	monster_mouth.play("talking")

	# Playing the talking audio
	$TalkingAudio.play() 

	# Changing the bubbles
	dialog_bubble.visible = true
	dreaming_bubble.visible = false


# Because we might have monsters with different number of eyes, we create a function to save all the eyes
func get_eyes(monster: Node) -> Array:
	var eyes_node = monster.get_node_or_null("Eyes") # Looking for a node called "Eyes" in the monster's scene
	if eyes_node: # If we find one
		return eyes_node.get_children().filter(func(n): return n is AnimatedSprite2D) # Get all the children from it and only keep the AnimatedSprite2D
	return []

# To have random colors of a monster
func _monster_color():
	var palette = [
	Color(1.0, 0.2, 0.2),  # red-ish
	Color(0.2, 1.0, 0.2),  # green-ish
	Color(0.2, 0.6, 1.0),  # blue-ish
	Color(1.0, 1.0, 0.4),  # yellow
	Color(0.8, 0.4, 1.0),  # purple
]
	var random_color = palette.pick_random()
	$MonsterBody1/MonsterBody.modulate = random_color

func _on_button_pressed() -> void:
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
		
