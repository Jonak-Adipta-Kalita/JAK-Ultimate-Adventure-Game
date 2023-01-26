extends Node2D

onready var canvasLayer = $CanvasLayer
onready var player = $StopOnPause/GreenHaven/YSort/Player

var updated_data = false

func _ready():
	PauseMenu.can_pause = true
	if DataManager.exists_data("global_position"):
		player.global_position = str2var(DataManager.get_data()["global_position"])
		updated_data = true
	else:
		DataManager.modify_data("global_position", Vector2.ZERO)
		updated_data = true

func _process(_delta):
	if updated_data:
		DataManager.modify_data("global_position", var2str(player.global_position))
	if get_tree().paused:
		canvasLayer.visible = false
	else:
		canvasLayer.visible = true
