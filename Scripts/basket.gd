extends Area2D

func _on_toast_dropped():
	if !Global.toastNumber <= 0:
		AudioManagerCooking.play_correct()
		Global.toastNumber -= 1
	else:
		AudioManagerCooking.play_wrong()

func _on_cheese_dropped():
	if !Global.cheeseNumber <= 0:
		AudioManagerCooking.play_correct()
		Global.cheeseNumber -= 1
	else:
		AudioManagerCooking.play_wrong()

func _on_tomatoes_dropped():
	if !Global.tomatoesNumber <= 0:
		AudioManagerCooking.play_correct()
		Global.tomatoesNumber -= 1
	else:
		AudioManagerCooking.play_wrong()

func _on_lettuce_dropped():
	if !Global.lettuceNumber <= 0:
		AudioManagerCooking.play_correct()
		Global.lettuceNumber -= 1
	else:
		AudioManagerCooking.play_wrong()
