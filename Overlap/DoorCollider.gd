extends Area2D

func _on_DoorCollider_body_entered(_body):
	var pathToInterrior = get_parent().pathToInterrior

	var _change_scene_error = get_tree().change_scene(pathToInterrior)
