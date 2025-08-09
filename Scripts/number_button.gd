extends Sprite2D

@export var number_value := 1
var default_texture : Texture2D

func _ready():
	default_texture = texture

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			get_parent().get_parent()._on_button_pressed(number_value)

func set_feedback(is_correct: bool):
	var color = ""
	if is_correct:
		color = "Green"
	else:
		color = "Red"

	var path = "res://Assets/NumberButtons/" + str(number_value) + "_" + color + ".svg"
	texture = load(path)


func reset_to_default():
	texture = default_texture
