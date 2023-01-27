extends Node2D

onready var canvasLayer = $CanvasLayer
onready var stopOnPause = $StopOnPause
onready var player = $StopOnPause/GreenHaven/YSort/Player
onready var waitForDataLoad = $WaitForDataLoad
onready var waitForDataLoadAnimPlayer = $WaitForDataLoad/AnimationPlayer

var updated_data = false

func update_data():
	DataManager.modify_data("player", {
		"global_position": var2str(Vector2(90.4049, 345.182)),
		"facing": var2str(player.animationTree.get("parameters/Idle/blend_position"))
	})

func _ready():
	waitForDataLoad.visible = true
	PauseMenu.can_pause = true

	if not DataManager.exists_data("player"):
		update_data()

	player.global_position = str2var(DataManager.get_data()["player"]["global_position"])
	updated_data = true

	waitForDataLoadAnimPlayer.play("Fade")
	yield(waitForDataLoadAnimPlayer, "animation_finished")

	waitForDataLoad.visible = false

func _process(_delta):
	if updated_data:
		update_data()

	if get_tree().paused:
		canvasLayer.visible = false
	else:
		canvasLayer.visible = true
