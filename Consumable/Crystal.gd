extends Area2D

onready var sprite = $Sprite

func _ready():
	randomize()
	var random_frame = randi() % 17 + 1
	sprite.frame = random_frame

func _on_Crystal_body_entered(_body):
	pass
