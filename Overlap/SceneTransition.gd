extends CanvasLayer

signal scene_changed()

onready var animation_player = $AnimationPlayer
onready var color_rect = $Control/ColorRect

func change_scene(path):
	animation_player.play("FadeIn")
	yield(animation_player, "animation_finished")
	var _change_scene_error = get_tree().change_scene(path)
	animation_player.play_backwards("FadeIn")
	yield(animation_player, "animation_finished")
	emit_signal("scene_changed")
