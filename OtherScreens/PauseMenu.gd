extends Node2D

onready var audioStreamPlayer = $AudioStreamPlayer2D

func _ready():
	audioStreamPlayer.stream = preload("res://Music and Sounds/Pause.wav")
	audioStreamPlayer.play()

func play_hover_sound():
	audioStreamPlayer.stream = preload("res://Music and Sounds/Menu Move.wav")
	audioStreamPlayer.play()

func play_menu_select_sound():
	audioStreamPlayer.stream = preload("res://Music and Sounds/Menu Select.wav")
	audioStreamPlayer.play()

func _on_ResumeButton_pressed():
	play_menu_select_sound()
	get_tree().paused = false
	audioStreamPlayer.stream = preload("res://Music and Sounds/Unpause.wav")
	audioStreamPlayer.play()

func _on_ExitButton_pressed():
	play_menu_select_sound()
	get_tree().paused = false
	var _change_scene_error = get_tree().change_scene("res://OtherScreens/Menu.tscn")

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = false
