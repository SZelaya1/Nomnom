extends Node

var toastNumber: int
var cheeseNumber: int
var tomatoesNumber: int
var lettuceNumber: int

func reset_ingredient_counts():
	toastNumber = randi() % 3 + 2
	cheeseNumber = randi() % 6 + 1
	tomatoesNumber = randi() % 6 + 1
	lettuceNumber = randi() % 7 + 1
