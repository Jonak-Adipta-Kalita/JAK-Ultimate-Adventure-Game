extends CanvasLayer

var can_be_viewed = false

func _process(_delta):
	visible = can_be_viewed
