extends Node2D

onready var canvasLayer = $CanvasLayer

func _ready():
	PauseMenu.can_pause = true

func _process(_delta):
	if get_tree().paused:
		canvasLayer.visible = false
	else:
		canvasLayer.visible = true
