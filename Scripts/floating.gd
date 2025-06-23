extends Node2D

@export var amplitude := 10.0
@export var speed := 1.0
@export var horizontal := false

var base_position: Vector2
var time_offset := 0.0

func _ready():
	base_position = position
	time_offset = randf_range(0.0, PI * 2)

func _process(_delta):
	var t := Time.get_ticks_msec() * 0.001
	var offset := sin((t + time_offset) * speed) * amplitude
	var x_offset := offset if horizontal else 0.0
	position = base_position + Vector2(x_offset, offset)
