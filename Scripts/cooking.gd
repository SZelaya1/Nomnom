extends Node2D

@onready var toast = $Square/ToastLabel
@onready var cheese = $Square/CheeseLabel
@onready var tomatoes = $Square/TomatoesLabel
@onready var lettuce = $Square/LettuceLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	toast.text = str(Global.toastNumber)
	cheese.text = str(Global.cheeseNumber)
	tomatoes.text = str(Global.tomatoesNumber)
	lettuce.text = str(Global.lettuceNumber)

func _process(delta: float) -> void:
	if Global.toastNumber == 0 and Global.cheeseNumber == 0 and Global.tomatoesNumber == 0 and Global.lettuceNumber == 0:
		$NextButton.visible = true

func _on_next_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/nomnom_eats.tscn")


func _on_back_to_select_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/select_game.tscn")
