extends StaticBody2D

signal go_down

func _on_Area2D_body_entered(_body):
	emit_signal("go_down")
