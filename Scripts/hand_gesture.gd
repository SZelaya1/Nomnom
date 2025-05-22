extends Node2D

# Function to get a random rumber between 1 to 5
func _randomNumber():
	var random = 1 + randi() % 5
	print(random)
	return random

func _loadGestureImage(random, isLeft):
	var handTexture : Texture2D
	match random:
		1:
			handTexture = preload("res://Assets/HandGestures/One_Hand.png")
		2:
			handTexture = preload("res://Assets/HandGestures/Two_Hand.png")
		3:
			handTexture = preload("res://Assets/HandGestures/Three_Hand.png")
		4:
			handTexture = preload("res://Assets/HandGestures/Four_Hand.png")
		5:
			handTexture = preload("res://Assets/HandGestures/Five_Hand.png")
	
	if (isLeft):
		$LeftHand.texture = handTexture
		$LeftHand.scale.x = 1
	else:
		$RightHand.texture = handTexture
		$RightHand.scale.x = -1
			

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_loadGestureImage(_randomNumber(), true)
	_loadGestureImage(_randomNumber(), false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
