extends KinematicBody2D

var can_interract = false

func interract():
	if not "aiden" in DataManager.get_data():
		DataManager.modify_data("aiden", {
			"phase": 1
		})

	var phase: int = DataManager.get_data()["aiden"]["phase"]

	if phase == 1:
		MessageBox.send_message("Hello %s, I am Aiden, I will be your partner in this Adventure." %  DataManager.get_data()["name"])

func _on_Area2D_body_entered(_body):
	can_interract = true

func _on_Area2D_body_exited(_body):
	can_interract = false

func _process(_delta):
	if can_interract and Input.is_action_just_pressed("ui_select"):
		interract()
