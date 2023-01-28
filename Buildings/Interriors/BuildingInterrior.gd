extends Node2D

onready var player = $YSort/Player

func _ready():
	PauseMenu.can_pause = true
	DataManager.ModifyData.player_data(
		player.global_position,
		Vector2.UP,
		PlayerStats.health,
		"buildinginterrior-" + name
	)

	DataManager.updated_data = true

func _process(_delta):
	if DataManager.updated_data and PlayerStats.health != 0:
		DataManager.ModifyData.player_data(
			player.global_position,
			player.animationTree.get("parameters/Idle/blend_position"),
			PlayerStats.health,
			"buildinginterrior-" + name
		)
