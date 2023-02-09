extends StaticBody2D

var can_interract = false

func interract():
	MessageBox.send_message("Hello!!")

func _on_Area2D_body_entered(_body):
	can_interract = true

func _on_Area2D_body_exited(_body):
	can_interract = false

func _process(_delta):
	if can_interract and Input.is_action_just_pressed("ui_select"):
		interract()
