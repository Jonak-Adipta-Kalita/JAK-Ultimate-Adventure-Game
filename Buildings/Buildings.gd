extends StaticBody2D

onready var door = $Door
onready var doorAnimationPlayer = $Door/AnimationPlayer

export(String) var pathToInterrior = ""

func _ready():
	door.visible = false

func _on_DoorCollider_body_entered(_body):
	door.visible = true
	doorAnimationPlayer.play("OpenDoor")

	yield(get_tree().create_timer(0.3), "timeout")

	SceneTransition.change_scene(pathToInterrior)
