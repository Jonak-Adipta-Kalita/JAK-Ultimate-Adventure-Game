extends StaticBody2D

signal go_down

onready var sprite = $Sprite

func _ready():
	sprite.flip_h = true

func _on_Area2D_body_entered(_body):
	emit_signal("go_down")
