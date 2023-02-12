extends Node2D

func _ready():
	PauseMenu.can_pause = false
	ActiveTasks.can_be_viewed = false

func _on_PlayButton_pressed():
	var data = DataManager.get_data()
	var location: String = data["player"]["location"] if DataManager.exists_data("player") else "overworld"
	var change_scene_to = ""

	if location == "overworld":
		change_scene_to = "res://MainScreens/Map.tscn"
	elif location.begins_with("buildinginterrior-"):
		change_scene_to = "res://Buildings/Interriors/" + location.split("-")[1] + "/" + data["player"]["floor"] + ".tscn"

	SceneTransition.change_scene(change_scene_to)

func _on_CreditsButton_pressed():
	var _change_scene_error = get_tree().change_scene("res://OtherScreens/Credits.tscn")
