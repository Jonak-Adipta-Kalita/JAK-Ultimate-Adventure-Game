extends Node2D

onready var canvasLayer = $CanvasLayer
onready var stopOnPause = $StopOnPause
onready var player = $StopOnPause/GreenHaven/YSort/Player
onready var waitForDataLoad = $WaitForDataLoad
onready var waitForDataLoadAnimPlayer = $WaitForDataLoad/AnimationPlayer

func _ready():
	waitForDataLoad.visible = true
	PauseMenu.can_pause = true

	if not DataManager.exists_data("player"):
		DataManager.ModifyData.player_data()

	player.global_position = str2var(DataManager.get_data()["player"]["global_position"])
	DataManager.updated_data = true

	waitForDataLoadAnimPlayer.play("Fade")
	yield(waitForDataLoadAnimPlayer, "animation_finished")

	waitForDataLoad.visible = false

func _process(_delta):
	if DataManager.updated_data and not DataManager.is_updating_ext_g_pos:
		if PlayerStats.health != 0:
			DataManager.ModifyData.player_data(
				player.global_position,
				player.animationTree.get("parameters/Idle/blend_position"),
				PlayerStats.health
			)
		else:
			var current_data = DataManager.get_data()
			DataManager.ModifyData.player_data(
				str2var(current_data["player"]["global_position"]),
				str2var(current_data["player"]["facing"]),
				PlayerStats.health
			)
	if get_tree().paused:
		canvasLayer.visible = false
	else:
		canvasLayer.visible = true
