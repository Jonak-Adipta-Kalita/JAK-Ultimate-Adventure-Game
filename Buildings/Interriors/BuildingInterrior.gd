extends Node2D

onready var player = $YSort/Player
onready var current_data = DataManager.get_data()

func _ready():
	PauseMenu.can_pause = true
	DataManager.is_updating_ext_g_pos = false
	while not "buildingexterior_global_pos" in Array(current_data["player"].keys()):
		yield(get_tree().create_timer(0.1), "timeout")
	if not current_data["player"]["location"].begins_with("buildinginterrior-"):
		DataManager.ModifyData.player_data(
			player.global_position,
			Vector2.UP,
			PlayerStats.health,
			"buildinginterrior-" + name,
			current_data["player"]["buildingexterior_global_pos"]
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
			"buildinginterrior-" + name,
			current_data["player"]["buildingexterior_global_pos"]
		)

func _on_Area2D_body_entered(_body):
	pass
