extends AnimatedSprite

func _ready():
	var _connect = connect("animation_finished", self, "_on_animation_finished")
	play("Animate")

func _on_animation_finished():
	queue_free()

	print("boom")

	var crystal = preload("res://Consumable/Crystal.tscn").instance()
	get_parent().add_child(crystal)

	crystal.global_position = global_position
