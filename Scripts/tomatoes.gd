extends Node2D

var selected = false
var mouse_offset = Vector2(0, 0)
@onready var area = $Area2D

func _process(delta):
	if selected:
		followMouse()
		
func followMouse():
	position = get_global_mouse_position() + mouse_offset
	
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			mouse_offset = position - get_global_mouse_position()
			selected = true
		else:
			selected = false
			
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.is_pressed():
		selected = false
		var overlapping_areas = area.get_overlapping_areas()
		for overlap in overlapping_areas:
			if overlap.name == "BasketScene":
				overlap.call("_on_tomatoes_dropped") 
				var toastLabel = get_parent().get_node("Square/TomatoesLabel")
				toastLabel.text = str(Global.tomatoesNumber)
				position = Vector2(568, 592)
