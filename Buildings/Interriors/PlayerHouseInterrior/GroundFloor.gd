extends "res://Buildings/Interriors/BuildingInterrior.gd"

func _on_StairUp_go_up():
	print("yo")
	SceneTransition.change_scene("res://Buildings/Interriors/PlayerHouseInterrior/FirstFloor.tscn")
