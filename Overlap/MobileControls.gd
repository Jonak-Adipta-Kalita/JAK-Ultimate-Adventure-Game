extends Node2D

onready var pauseButton = $PauseButton
onready var killButton = $KillButton
onready var rollButton = $RollButton
onready var interractButton = $InterractButton

func _input(event):
	if not event is InputEventScreenTouch:
		return

	if not event.pressed:
		return

	var action = ""

	if is_in_rect(event.position, pauseButton.get_rect()):
		action = "ui_cancel"
	elif is_in_rect(event.position, killButton.get_rect()):
		action = "attack"
	elif is_in_rect(event.position, rollButton.get_rect()):
		action = "roll"
	elif is_in_rect(event.position, rollButton.get_rect()):
		action = "ui_select"

	Input.action_press(action)
	yield(get_tree().create_timer(0.1), "timeout")
	Input.action_release(action)

func is_in_rect(pos: Vector2, rect: Rect2):
	return pos.x > rect.position.x and pos.y > rect.position.y and pos.x < rect.end.x and pos.y < rect.end.y
