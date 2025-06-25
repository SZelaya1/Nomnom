extends Node2D

# Storing the labels in variables
@onready var toast = $Ingredients/ToastLabel
@onready var cheese = $Ingredients/CheeseLabel
@onready var tomatoes = $Ingredients/TomatoesLabel
@onready var lettuce = $Ingredients/LettuceLabel

func _ready():
	# Displaying the numbers
	Global.reset_ingredient_counts()
	
	toast.text = str(Global.toastNumber)
	cheese.text = str(Global.cheeseNumber)
	tomatoes.text = str(Global.tomatoesNumber)
	lettuce.text = str(Global.lettuceNumber)
	
	# Stops main menu music
	if AudioManagerMain.has_method("stop_music"):
		AudioManagerMain.stop_music()

	# Plays music from this scene
	AudioManagerCooking.play_music("res://Assets/Audios/cooking.wav")
	
func _on_next_button_pressed():
	UiButtonAudio.play_click()
	get_tree().change_scene_to_file("res://Scenes/cooking.tscn")

func _on_back_to_select_pressed():
	# Reseting ingredient numbers
	Global.reset_ingredient_counts()
	
	# Stopping music
	if AudioManagerCooking.has_method("stop_music"):
		AudioManagerCooking.stop_music()

	UiButtonAudio.play_close()
	get_tree().change_scene_to_file("res://Scenes/select_game.tscn")
