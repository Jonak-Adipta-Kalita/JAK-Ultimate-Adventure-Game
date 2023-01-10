extends Node2D

const GrassDestroyEffect = preload("res://Effects/GrassDestroyEffect.tscn")

func create_grass_effect():
	var grassDestroyEffect = GrassDestroyEffect.instance()

	get_parent().add_child(grassDestroyEffect)
	grassDestroyEffect.global_position = global_position

func _on_HurtBox_area_entered(_area):
	create_grass_effect()
	queue_free()
