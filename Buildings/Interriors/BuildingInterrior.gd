extends Node2D

onready var player = $YSort/Player
onready var current_data = DataManager.get_data()

func modify_player_data(facing=Vector2.UP):
	DataManager.ModifyData.player_data(
		player.global_position,
		facing,
		PlayerStats.health,
		"buildinginterrior-" + name.split("_")[0],
		str2var(current_data["player"]["buildingexterior_global_pos"]),
		name.split("_")[1]
	)

func _ready():
	PauseMenu.can_pause = true
	DataManager.inside_house = true
	DataManager.is_changing_floor = false
	DataManager.is_updating_ext_g_pos = false


	while not "buildingexterior_global_pos" in Array(current_data["player"].keys()):
		yield(get_tree().create_timer(0.1), "timeout")

	if current_data["player"]["location"] == "buildinginterrior-" + name.split("_")[0]:
		if current_data["player"]["floor"] != name.split("_")[1]:
			if current_data["player"]["floor"] != "GroundFloor":
				var stair_carpet = $StairCarpet
				player.global_position = stair_carpet.global_position + Vector2(-5, 0)

			modify_player_data(str2var(current_data["player"]["facing"]))
		else:
			player.global_position = str2var(current_data["player"]["global_position"])

	DataManager.updated_data = true

func _process(_delta):
	if DataManager.updated_data and PlayerStats.health != 0:
		modify_player_data(player.animationTree.get("parameters/Idle/blend_position"))

func _on_Area2D_body_entered(_body):
	SceneTransition.change_scene("res://MainScreens/Map.tscn")
