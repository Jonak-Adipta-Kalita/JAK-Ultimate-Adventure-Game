extends KinematicBody2D

var can_interract = false

func interract():
	var phase: int = DataManager.get_data()["phase"]

	if phase == 1:
		MessageBox.send_message("Hello %s !!" %  DataManager.get_data()["name"])

func _on_Area2D_body_entered(_body):
	can_interract = true

func _on_Area2D_body_exited(_body):
	can_interract = false

func _process(_delta):
	if can_interract and Input.is_action_just_pressed("ui_select"):
		interract()
