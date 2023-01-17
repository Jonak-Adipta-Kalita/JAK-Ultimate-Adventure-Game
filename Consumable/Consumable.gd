extends Area2D

export(int) var heal_points = 0

onready var audioStreamPlayer = $AudioStreamPlayer2D

func _on_Consumable_body_entered(_body):
	if not PlayerStats.health == PlayerStats.max_health:
		PlayerStats.health += heal_points
		if !audioStreamPlayer.is_playing():
			audioStreamPlayer.play()
			print("playing")
		print("played")

func _on_AudioStreamPlayer2D_finished():
	queue_free()
