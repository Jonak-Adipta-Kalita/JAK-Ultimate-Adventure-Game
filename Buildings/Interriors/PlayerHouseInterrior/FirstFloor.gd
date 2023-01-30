extends "res://Buildings/Interriors/BuildingInterrior.gd"

func _on_StairDown_go_down():
	DataManager.is_changing_floor = true
	SceneTransition.change_scene("res://Buildings/Interriors/PlayerHouseInterrior/GroundFloor.tscn")
