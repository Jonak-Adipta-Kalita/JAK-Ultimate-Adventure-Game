extends "res://Buildings/Interriors/BuildingInterrior.gd"

func _on_StairUp_go_up():
	DataManager.is_changing_floor = true
	SceneTransition.change_scene("res://Buildings/Interriors/PlayerHouseInterrior/FirstFloor.tscn")
