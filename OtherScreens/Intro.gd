extends Node2D

onready var animationPlayer = $AnimationPlayer

func _ready():
	randomize()

	animationPlayer.play("FadeIn")
	yield(get_tree().create_timer(6), "timeout")
	animationPlayer.play("FadeOut")
	yield(get_tree().create_timer(3), "timeout")

	var _change_scene_error = get_tree().change_scene("res://OtherScreens/Menu.tscn")
