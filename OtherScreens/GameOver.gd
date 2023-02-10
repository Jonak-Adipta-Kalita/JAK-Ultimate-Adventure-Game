extends Node2D

func _ready():
	PauseMenu.can_pause = false
	ActiveTasks.can_be_viewed = false

func _on_RetryButton_pressed():
	var current_data = DataManager.get_data()
	DataManager.ModifyData.player_data(
		str2var(current_data["player"]["global_position"]),
		str2var(current_data["player"]["facing"]),
		PlayerStats.max_health
	)
	SceneTransition.change_scene("res://MainScreens/Map.tscn")

func _on_MenuButton_pressed():
	var _change_scene_error = get_tree().change_scene("res://OtherScreens/Menu.tscn")
