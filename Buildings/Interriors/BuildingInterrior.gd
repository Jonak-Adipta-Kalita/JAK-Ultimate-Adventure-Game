extends Node2D

onready var player = $YSort/Player
onready var current_data = DataManager.get_data()

func _ready():
	PauseMenu.can_pause = true

	if not current_data["player"]["location"].begins_with("buildinginterrior-"):
		DataManager.ModifyData.player_data(
			player.global_position,
			Vector2.UP,
			PlayerStats.health,
			"buildinginterrior-" + name
		)
	else:
		player.global_position = str2var(current_data["player"]["global_position"])

	DataManager.updated_data = true

func _process(_delta):
	if DataManager.updated_data and PlayerStats.health != 0:
		DataManager.ModifyData.player_data(
			player.global_position,
			player.animationTree.get("parameters/Idle/blend_position"),
			PlayerStats.health,
			"buildinginterrior-" + name
		)
