extends Node2D

onready var intro = $Intro
onready var introAnimationPlayer = $Intro/AnimationPlayer

onready var mainWindow = $MainWindow

func _ready():
	intro.visible = true
	mainWindow.visible = false
	
	introAnimationPlayer.play("FadeIn")
	yield(get_tree().create_timer(6), "timeout")
	introAnimationPlayer.play("FadeOut")
	yield(get_tree().create_timer(3), "timeout")
	
	intro.visible = false
	mainWindow.visible = true
