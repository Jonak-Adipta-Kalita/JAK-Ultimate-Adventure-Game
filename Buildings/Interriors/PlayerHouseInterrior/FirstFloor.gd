extends "res://Buildings/Interriors/BuildingInterrior.gd"

func _on_StairDown_go_down():
	SceneTransition.change_scene("res://Buildings/Interriors/PlayerHouseInterrior/GroundFloor.tscn")
