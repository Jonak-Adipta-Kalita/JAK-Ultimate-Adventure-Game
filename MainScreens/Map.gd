extends Node2D

onready var canvasLayer = $CanvasLayer
onready var stopOnPause = $StopOnPause
onready var player = $StopOnPause/GreenHaven/YSort/Player
onready var waitForDataLoad = $WaitForDataLoad
onready var waitForDataLoadAnimPlayer = $WaitForDataLoad/AnimationPlayer

func update_data(global_position=Vector2(90.4049, 345.182), facing=Vector2.DOWN):
	DataManager.modify_data("player", {
		"global_position": var2str(global_position),
		"facing": var2str(facing)
	})

func _ready():
	waitForDataLoad.visible = true
	PauseMenu.can_pause = true

	DataManager.modify_data("location", "overworld")

	if not DataManager.exists_data("player"):
		update_data()

	player.global_position = str2var(DataManager.get_data()["player"]["global_position"])
	DataManager.updated_data = true

	waitForDataLoadAnimPlayer.play("Fade")
	yield(waitForDataLoadAnimPlayer, "animation_finished")

	waitForDataLoad.visible = false

func _process(_delta):
	if DataManager.updated_data:
		update_data(player.global_position, player.animationTree.get("parameters/Idle/blend_position"))

	if get_tree().paused:
		canvasLayer.visible = false
	else:
		canvasLayer.visible = true
