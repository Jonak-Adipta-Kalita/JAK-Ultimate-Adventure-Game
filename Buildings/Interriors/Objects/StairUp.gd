extends StaticBody2D

signal go_up

func _on_Area2D_body_entered(_body):
	emit_signal("go_up")
