extends KinematicBody2D

const BatDeathEffect = preload("res://Effects/BatDeathEffect.tscn")

export(int) var MAX_SPEED = 50
export(int) var ACCELERATION = 200
export(int) var FRICTION = 200

enum {
	IDLE,
	WANDER,
	CHASE
}

var velocity = Vector2.ZERO
var knockback = Vector2.ZERO
var state = IDLE

onready var stats = $Stats
onready var playerDetectionZone = $PlayerDetectionZone
onready var sprite = $AnimatedSprite
onready var hurtbox = $HurtBox
onready var softCollision = $SoftCollision

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, ACCELERATION * delta)
	knockback = move_and_slide(knockback)

	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, ACCELERATION * delta)
			seek_player()
		WANDER:
			pass
		CHASE:
			var player = playerDetectionZone.player
			
			if player != null:
				var direction_to_player = position.direction_to(player.global_position)
				velocity = velocity.move_toward(direction_to_player * MAX_SPEED, ACCELERATION * delta)
			else:
				state = IDLE

			sprite.flip_h = velocity.x < 0

	if softCollision.is_colliding():
		velocity += softCollision.get_push_vector() * delta * 400

	velocity = move_and_slide(velocity)

func seek_player():
	if playerDetectionZone.can_see_player():
		state = CHASE

func _on_HurtBox_area_entered(area):
	stats.health -= area.damage
	knockback = area.knockback_vector * 120
	hurtbox.create_hit_effect()

func _on_Stats_no_health():
	queue_free()
	
	var batDeathEffect = BatDeathEffect.instance()
	get_parent().add_child(batDeathEffect)
	
	batDeathEffect.global_position = global_position
