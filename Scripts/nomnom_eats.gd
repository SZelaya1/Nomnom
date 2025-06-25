extends Node2D

func _ready():
	if AudioManagerCooking.has_method("stop_music"):
		AudioManagerCooking.stop_music()
