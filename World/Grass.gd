extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("attack"):
		var grassEfect = load("res://Effects/GrassEffect.tscn").instance()
		var world = get_tree().current_scene

		world.add_child(grassEfect)
		grassEfect.global_position = global_position

		queue_free()
