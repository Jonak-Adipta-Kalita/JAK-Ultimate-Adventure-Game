extends Node2D

var change_scene_to = ""

onready var animationPlayer = $AnimationPlayer
onready var timer = $Timer

func start_timer():
	timer.start(3)

func _on_ReadyButton_pressed():
	animationPlayer.play("FadeIn")
	change_scene_to = "res://MainScreens/Map.tscn"
	start_timer()

func _on_MenuButton_pressed():
	animationPlayer.play("FadeIn")
	change_scene_to = "res://OtherScreens/Menu.tscn"
	start_timer()

func _on_Timer_timeout():
	var _change_scene_error = get_tree().change_scene(change_scene_to)
