extends StaticBody2D

onready var animationPlayer = $AnimationPlayer

var can_interract = false
var is_open = false
var dropped = false

func drop_item():
	pass

func _on_Area2D_body_entered(_body):
	can_interract = true

func _on_Area2D_body_exited(_body):
	can_interract = false
	if is_open:
		animationPlayer.play("ChestClose")
		is_open = false

func _process(_delta):
	if can_interract and Input.is_action_just_pressed("ui_select"):
		if not is_open:
			dropped = true
			is_open = true
			animationPlayer.play("ChestOpen")
		else:
			animationPlayer.play("ChestClose")
			is_open = false

func _on_AnimationPlayer_animation_finished(anim_name: String):
	if dropped and anim_name == "ChestOpen":
		drop_item()
