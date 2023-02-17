extends Node2D

func change_scene():
	var _change_scene_error = get_tree().change_scene("res://OtherScreens/Menu.tscn")

func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		change_scene()

func _on_CancelButton_pressed():
	change_scene()
