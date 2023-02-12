extends Area2D

onready var sprite = $Sprite

func _ready():
	randomize()
	var random_frame = randi() % 35 + 1
	sprite.frame = random_frame
