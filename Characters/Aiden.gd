extends KinematicBody2D

var can_interract = false

func interract():
	if MessageBox.showing_text:
		MessageBox.send_message("Hide")
		return

	if not "aiden" in DataManager.get_data():
		DataManager.ModifyData.aiden_data(1, false)

	var aiden_data = DataManager.get_data()["aiden"]
	var player_data = DataManager.get_data()["player"]

	var phase: int = aiden_data["phase"]
	var task_asked: bool = aiden_data["task_asked"]

	if phase == 1:
		MessageBox.send_message("Hello %s, I am Aiden, I will be your partner in this Adventure." %  DataManager.get_data()["name"])
		DataManager.ModifyData.aiden_data(2, false)
	elif phase == 2:
		if not task_asked:
			MessageBox.send_message("Can you do the following: 1) Kill 50 Bats, 2) Collect 100 ExP")
			DataManager.ModifyData.aiden_data(2, true)
		elif player_data["bats_killed"] >= 50 and player_data["exp"] >= 100.0:
			MessageBox.send_message("Well Done!! You have completed your First Quest!!")
			DataManager.ModifyData.aiden_data(3, false)
		else:
			MessageBox.send_message("Please complete the Tasks!!")
			DataManager.ModifyData.aiden_data(2, true)
	elif phase == 3:
		pass

func _on_Area2D_body_entered(_body):
	can_interract = true

func _on_Area2D_body_exited(_body):
	can_interract = false

func _process(_delta):
	if can_interract and Input.is_action_just_pressed("ui_select"):
		interract()
