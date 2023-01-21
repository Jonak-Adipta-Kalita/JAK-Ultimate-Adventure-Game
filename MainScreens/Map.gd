extends Node2D

onready var canvasLayer = $CanvasLayer

var pauseMenu = preload("res://OtherScreens/PauseMenu.tscn").instance()
var showed_pause_menu = false

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = true

	if get_tree().paused:
		canvasLayer.visible = false
		if not showed_pause_menu:
			get_parent().add_child(pauseMenu)
			pauseMenu.play_pause_sound()
			showed_pause_menu = true
	else:
		canvasLayer.visible = true
		if showed_pause_menu:
			get_parent().remove_child(pauseMenu)
			showed_pause_menu = false
