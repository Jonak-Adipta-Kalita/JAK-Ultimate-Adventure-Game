extends "res://Overlap/Stats.gd"

onready var noHealthTimer = $NoHealthTimer
var counter = 0

func _on_PlayerStats_no_health():
	noHealthTimer.start(3)

func _on_NoHealthTimer_timeout():
	noHealthTimer.wait_time = 1
	noHealthTimer.stop()
	var _change_scene_error = get_tree().change_scene("res://OtherScreens/GameOver.tscn")

func _on_PlayerStats_health_changed(_value):
	pass
