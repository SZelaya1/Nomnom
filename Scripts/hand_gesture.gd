extends Node2D

var rightAnswer = 0 # Global variable to store the correct answer

# Function to get a random rumber between 1 to 5
func _randomNumber():
	var random = 1 + randi() % 5
	print(random)
	return random

# Function to load hand gesture images based on the side (right or left)
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
		$LeftHand.scale.x = 0.34
	else:
		$RightHand.texture = handTexture
		$RightHand.scale.x = -0.34
		

# This function will get the cliked Sprite value and compare it with the answer of the player	
func _on_button_pressed(clickedNumber):
	if (rightAnswer == clickedNumber) :
		print("Correct answer")
	else:
		print("Wrong answer")
	
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var random1 = _randomNumber()
	var random2 = _randomNumber()
	_loadGestureImage(random1, true)
	_loadGestureImage(random2, false)
	
	rightAnswer = random1 + random2
