extends Node2D

var right_answer := 0
var streak := 0

# Create a new exercise and reset all buttons
func _create_new_exercise():
	var random1 = 1 + randi() % 5
	var random2 = 1 + randi() % 5
	right_answer = random1 + random2

	_load_hand_texture(random1, true)
	_load_hand_texture(random2, false)

	# Reset original button texture
	for number_node in $NumberButtons.get_children():
		if number_node.has_method("reset_to_default"):
			number_node.reset_to_default()

# Loads hand textures
func _load_hand_texture(value: int, is_left: bool):
	var path = ""
	match value:
		1: path = "res://Assets/HandGestures/One_Hand.png"
		2: path = "res://Assets/HandGestures/Two_Hand.png"
		3: path = "res://Assets/HandGestures/Three_Hand.png"
		4: path = "res://Assets/HandGestures/Four_Hand.png"
		5: path = "res://Assets/HandGestures/Five_Hand.png"

	var texture = load(path)

	if is_left:
		$LeftHand.texture = texture
		$LeftHand.scale.x = 0.34
	else:
		$RightHand.texture = texture
		$RightHand.scale.x = -0.34

# Function called by the buttons when clicked
func _on_button_pressed(number: int):
	if number == right_answer:
		streak += 1
		$FeedBackSounds/CorrectSound.play()
		_show_feedback(number, true)
		if streak % 5 == 0:
			_show_streak()
		await get_tree().create_timer(1.0).timeout
		_create_new_exercise()
	else:
		streak = 0
		$FeedBackSounds/WrongSound.play()
		_show_feedback(number, false)

# 5 in a row effect
func _show_streak():
	$StreakImage.visible = true
	await get_tree().create_timer(2.0).timeout
	$StreakImage.visible = false

# Number button visual feedback
func _show_feedback(number: int, correct: bool):
	var name_map = {
		1: "One", 
		2: "Two", 
		3: "Three", 
		4: "Four", 
		5: "Five",
		6: "Six", 
		7: "Seven", 
		8: "Eight", 
		9: "Nine", 
		10: "Ten"
	}
	if name_map.has(number):
		var node_name = name_map[number]
		var button_node = $NumberButtons.get_node(node_name)
		if button_node and button_node.has_method("set_feedback"):
			button_node.set_feedback(correct)

func _ready():
	# Stops the music from the menu
	if AudioManagerMain.has_method("stop_music"):
		AudioManagerMain.stop_music()

	# Music from this scene
	randomize()
	_create_new_exercise()
	if $BackgroundMusic_HG.stream:
		$BackgroundMusic_HG.play()
		if not $BackgroundMusic_HG.is_connected("finished", Callable(self, "_on_music_finished")):
			$BackgroundMusic_HG.connect("finished", Callable(self, "_on_music_finished"))

func _on_music_finished():
	$BackgroundMusic_HG.play()

func _on_back_to_select_pressed():
	UiButtonAudio.play_close()
	get_tree().change_scene_to_file("res://Scenes/select_game.tscn")
