extends "res://Effects/Effect.gd"

func _on_EnemyDeathEffect_animation_finished():
	var crystal = preload("res://Consumable/Crystal.tscn").instance()
	get_parent().add_child(crystal)

	crystal.global_position = global_position - Vector2(0, 3)
