extends Node2D

# Storing the labels in variables
@onready var toast = $Ingredients/ToastLabel
@onready var cheese = $Ingredients/CheeseLabel
@onready var tomatoes = $Ingredients/TomatoesLabel
@onready var lettuce = $Ingredients/LettuceLabel

func _ready()  -> void:
	# Displaying the numbers
	toast.text = str(Global.toastNumber)
	cheese.text = str(Global.cheeseNumber)
	tomatoes.text = str(Global.tomatoesNumber)
	lettuce.text = str(Global.lettuceNumber)
	
func _on_next_button_pressed() -> void:
		get_tree().change_scene_to_file("res://Scenes/cooking.tscn")
