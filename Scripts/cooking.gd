extends Node2D

@onready var toast = $Square/ToastLabel
@onready var cheese = $Square/CheeseLabel
@onready var tomatoes = $Square/TomatoesLabel
@onready var lettuce = $Square/LettuceLabel

var celebration_triggered = false

# Called when the node enters the scene tree for the first time.
func _ready():
	toast.text = str(Global.toastNumber)
	cheese.text = str(Global.cheeseNumber)
	tomatoes.text = str(Global.tomatoesNumber)
	lettuce.text = str(Global.lettuceNumber)

func _process(delta: float):
	if not celebration_triggered and Global.toastNumber == 0 and Global.cheeseNumber == 0 and Global.tomatoesNumber == 0 and Global.lettuceNumber == 0:
		celebration_triggered = true
		$NextButton.visible = true
		$Confetti.visible = true
		$Confetti.play()
		$YaySound.play()

func _on_next_button_pressed():
	UiButtonAudio.play_click()
	get_tree().change_scene_to_file("res://Scenes/nomnom_eats.tscn")

func _on_back_to_select_pressed():
	# Reseting ingredient numbers
	Global.reset_ingredient_counts()
	
	# Stopping music
	if AudioManagerCooking.has_method("stop_music"):
		AudioManagerCooking.stop_music()
	
	UiButtonAudio.play_close()
	get_tree().change_scene_to_file("res://Scenes/select_game.tscn")
