extends Node2D

func _ready():
	PauseMenu.can_pause = false

func _on_PlayButton_pressed():
	SceneTransition.change_scene("res://MainScreens/Map.tscn")

func _on_CreditsButton_pressed():
	var _change_scene_error = get_tree().change_scene("res://OtherScreens/Credits.tscn")
