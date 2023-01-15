extends Sprite

onready var playerAnimationPlayer = $Player/AnimationPlayer

func _ready():
	playerAnimationPlayer.play("IdleUp")
