extends StaticBody2D

onready var animationPlayer = $AnimationPlayer
onready var droppedItem = $DroppedItem

var item_to_drop = preload("res://Consumable/Apple.tscn").instance()

var can_interract = false
var is_open = false
var dropped = false

func drop_item():
	droppedItem.add_child(item_to_drop)

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
			is_open = true
			animationPlayer.play("ChestOpen")
		else:
			animationPlayer.play("ChestClose")
			is_open = false

func _on_AnimationPlayer_animation_finished(anim_name: String):
	if not dropped and anim_name == "ChestOpen":
		drop_item()
		dropped = true
