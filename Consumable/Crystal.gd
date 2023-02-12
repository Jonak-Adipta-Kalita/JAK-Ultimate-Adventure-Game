extends Area2D

onready var sprite = $Sprite
const ExP = 2

func _ready():
	randomize()
	var random_frame = randi() % 17 + 1
	sprite.frame = random_frame

func _on_Crystal_body_entered(_body):
	var player_collection_data = DataManager.get_data()["player_collection"]

	DataManager.ModifyData.player_collection_data(
		player_collection_data["bats_killed"],
		player_collection_data["exp"] + ExP,
		player_collection_data["crystals_collected"] + 1
	)

	queue_free()
