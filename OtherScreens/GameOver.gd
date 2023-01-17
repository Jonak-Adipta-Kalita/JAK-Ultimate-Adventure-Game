extends Node2D

func _on_ReadyButton_pressed():
	var _change_scene_error = get_tree().change_scene("res://MainScreens/Map.tscn")

func _on_MenuButton_pressed():
	var _change_scene_error = get_tree().change_scene("res://OtherScreens/Menu.tscn")
