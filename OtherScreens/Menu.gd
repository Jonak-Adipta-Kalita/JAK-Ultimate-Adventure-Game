extends Node2D

var location: String = DataManager.get_data()["player"]["location"]

func _ready():
	PauseMenu.can_pause = false

func _on_PlayButton_pressed():
	var change_scene_to = ""

	if location == "overworld":
		change_scene_to = "res://MainScreens/Map.tscn"
	elif location.begins_with("buildinginterrior"):
		change_scene_to = "res://Buildings/Interriors/" + "/".join(location.split("-")[1].split("_")) + ".tscn"

	SceneTransition.change_scene(change_scene_to)

func _on_CreditsButton_pressed():
	var _change_scene_error = get_tree().change_scene("res://OtherScreens/Credits.tscn")
