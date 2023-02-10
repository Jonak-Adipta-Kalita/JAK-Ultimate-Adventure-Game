extends StaticBody2D

onready var door = $Door
onready var doorAnimationPlayer = $Door/AnimationPlayer
onready var player = get_node("/root/Map/StopOnPause/GreenHaven/YSort/Player")

export(String) var pathToInterrior = ""

func _ready():
	door.visible = false

func _on_DoorCollider_body_entered(_body):
	var current_data = DataManager.get_data()
	DataManager.is_updating_ext_g_pos = true
	DataManager.ModifyData.player_data(
		player.global_position,
		player.animationTree.get("parameters/Idle/blend_position"),
		PlayerStats.health,
		"overworld",
		current_data["player"]["bats_killed"],
		current_data["player"]["exp"],
		player.global_position + Vector2(0, 10)
	)

	door.visible = true
	doorAnimationPlayer.play("OpenDoor")

	yield(get_tree().create_timer(0.3), "timeout")

	SceneTransition.change_scene(pathToInterrior)
