extends CanvasLayer

onready var label = $Label
var showing_text = false

func _ready():
	visible = false

func send_message(message: String):
	if not showing_text:
		visible = true
		label.text = message
		showing_text = true
	else:
		showing_text = false
		label.text = ""
		visible = false
