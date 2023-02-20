extends Node2D

func _on_KillButton_pressed():
	Input.action_press("attack")
	yield(get_tree().create_timer(0.1), "timeout")
	Input.action_release("attack")

func _on_RollButton_pressed():
	Input.action_press("roll")
	yield(get_tree().create_timer(0.1), "timeout")
	Input.action_release("roll")

func _on_InterractButton_pressed():
	Input.action_press("ui_select")
	yield(get_tree().create_timer(0.1), "timeout")
	Input.action_release("ui_select")

func _on_PauseButton_pressed():
	Input.action_press("ui_cancel")
	yield(get_tree().create_timer(0.1), "timeout")
	Input.action_release("ui_cancel")
