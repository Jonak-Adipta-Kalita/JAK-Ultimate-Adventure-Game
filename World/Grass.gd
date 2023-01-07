extends Node2D

func create_grass_effect():
	var grassEfect = load("res://Effects/GrassEffect.tscn").instance()
	var world = get_tree().current_scene

	world.add_child(grassEfect)
	grassEfect.global_position = global_position

func _on_HurtBox_area_entered(_area):
	create_grass_effect()
	queue_free()
