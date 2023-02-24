extends Area2D

var player = null

func can_see_player():
	if PlayerStats.invincible:
		return false
	return player != null

func _on_PlayerDetectionZone_body_entered(body):
	player = body

func _on_PlayerDetectionZone_body_exited(_body):
	player = null
