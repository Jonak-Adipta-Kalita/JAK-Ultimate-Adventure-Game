extends CanvasLayer

onready var pauseAudioStreamPlayer = $PauseAudioStreamPlayer2D
onready var menuMoveAudioStreamPlayer = $MenuMoveAudioStreamPlayer2D
onready var menuSelectAudioStreamPlayer = $MenuSelectAudioStreamPlayer2D

var can_pause = false

func play_hover_sound():
	menuMoveAudioStreamPlayer.play()

func play_menu_select_sound():
	menuSelectAudioStreamPlayer.play()

func play_pause_sound():
	pauseAudioStreamPlayer.play()

func _on_ResumeButton_pressed():
	play_menu_select_sound()
	visible = false
	get_tree().paused = false

func _on_ExitButton_pressed():
	play_menu_select_sound()
	visible = false
	get_tree().paused = false
	var _change_scene_error = get_tree().change_scene("res://OtherScreens/Menu.tscn")

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel") and can_pause:
		if get_tree().paused:
			get_tree().paused = false
			visible = false
		else:
			get_tree().paused = true
			visible = true

func _ready():
	visible = false
