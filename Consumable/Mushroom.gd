extends Area2D

var heal_points = 3

onready var audioStreamPlayer = $AudioStreamPlayer2D
onready var sprite = $Sprite

func _ready():
	randomize()
	var random_frame = randi() % 35 + 1
	sprite.frame = random_frame

func _on_Consumable_body_entered(_body):
	if not PlayerStats.health == PlayerStats.max_health:
		PlayerStats.health = min(PlayerStats.health + heal_points, PlayerStats.max_health)
		audioStreamPlayer.play()
		visible = false

func _on_AudioStreamPlayer2D_finished():
	queue_free()
