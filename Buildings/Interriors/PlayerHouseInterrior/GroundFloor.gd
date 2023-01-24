extends Node2D

func _on_StairUp_go_up():
	SceneTransition.change_scene("res://Buildings/Interriors/PlayerHouseInterrior/FirstFloor.tscn")

func _on_Area2D_body_entered(_body):
	pass
