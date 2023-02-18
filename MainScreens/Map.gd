extends Node2D

onready var stopOnPause = $StopOnPause
onready var player = $StopOnPause/GreenHaven/YSort/Player
onready var waitForDataLoad = $WaitForDataLoad
onready var waitForDataLoadAnimPlayer = $WaitForDataLoad/AnimationPlayer

func _ready():
	waitForDataLoad.visible = true
	DataManager.inside_house = false
	PauseMenu.can_pause = true

	if not DataManager.exists_data("player"):
		DataManager.ModifyData.player_data()
	
	if not DataManager.exists_data("player_collection"):
		DataManager.ModifyData.player_collection_data()

	if "buildingexterior_global_pos" in Array(DataManager.get_data()["player"].keys()):
		player.global_position = str2var(DataManager.get_data()["player"]["buildingexterior_global_pos"])
	else:
		player.global_position = str2var(DataManager.get_data()["player"]["global_position"])
	DataManager.updated_data = true

	waitForDataLoadAnimPlayer.play("Fade")
	yield(waitForDataLoadAnimPlayer, "animation_finished")

	waitForDataLoad.visible = false
	ActiveTasks.can_be_viewed = true

func _process(_delta):
	if DataManager.updated_data and not DataManager.is_updating_ext_g_pos:
		var current_data = DataManager.get_data()
		DataManager.ModifyData.player_data(
			player.global_position if PlayerStats.health != 0 else str2var(current_data["player"]["global_position"]),
			player.animationTree.get("parameters/Idle/blend_position") if PlayerStats.health != 0 else str2var(current_data["player"]["facing"]),
			PlayerStats.health
		)
