extends Node2D

func _on_PlayButton_pressed():
	var _change_scene_error = get_tree().change_scene("res://MainScreens/GreenHaven.tscn")

func _on_CreditsButton_pressed():
	var _change_scene_error = get_tree().change_scene("res://OtherScreens/Credits.tscn")
