extends Node2D

func _ready():
	PauseMenu.can_pause = false

func _on_RetryButton_pressed():
	PlayerStats.health = PlayerStats.max_health
	SceneTransition.change_scene("res://MainScreens/Map.tscn")

func _on_MenuButton_pressed():
	var _change_scene_error = get_tree().change_scene("res://OtherScreens/Menu.tscn")
