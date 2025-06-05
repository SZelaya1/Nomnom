extends Area2D

func _on_toast_dropped():
	if !Global.toastNumber <= 0:
		Global.toastNumber -= 1

func _on_cheese_dropped():
	if !Global.cheeseNumber <= 0:
		Global.cheeseNumber -= 1

func _on_tomatoes_dropped():
	if !Global.tomatoesNumber <= 0:
		Global.tomatoesNumber -= 1

func _on_lettuce_dropped():
	if !Global.lettuceNumber <= 0:
		Global.lettuceNumber -= 1
