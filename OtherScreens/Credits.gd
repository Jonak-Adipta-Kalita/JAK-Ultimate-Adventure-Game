extends Node2D

onready var cancelButton = $CancelButton

func change_scene():
	var _change_scene_error = get_tree().change_scene("res://OtherScreens/Menu.tscn")

func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		change_scene()

func _on_TextureButton_pressed():
	change_scene()
