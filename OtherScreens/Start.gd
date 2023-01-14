extends Node2D

onready var intro = $Intro
onready var introAnimationPlayer = $Intro/AnimationPlayer
onready var mainWindow = $MainWindow

var loaded = false

func _ready():
	intro.visible = true
	mainWindow.visible = false
	
	introAnimationPlayer.play("FadeIn")
	yield(get_tree().create_timer(6), "timeout")
	introAnimationPlayer.play("FadeOut")
	yield(get_tree().create_timer(3), "timeout")
	
	intro.visible = false
	mainWindow.visible = true
	
	loaded = true

func _on_PlayButton_pressed():
	var _change_scene_error = get_tree().change_scene("res://World.tscn")

func _on_CreditsButton_pressed():
	pass
