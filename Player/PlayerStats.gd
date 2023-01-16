extends "res://Overlap/Stats.gd"

onready var noHealthTimer = $NoHealthTimer

func _on_PlayerStats_no_health():
	noHealthTimer.start(3)

func _on_NoHealthTimer_timeout():
	var _change_scene_error = get_tree().change_scene("res://OtherScreens/GameOver.tscn")
