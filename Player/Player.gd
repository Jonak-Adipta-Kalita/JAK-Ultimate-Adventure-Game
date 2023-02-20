extends KinematicBody2D

const PlayerHurtSound = preload("res://Player/PlayerHurtSound.tscn")

export(int) var MAX_SPEED = 60
export(int) var ROLL_SPEED = 100
export(int) var ACCELERATION = 500
export(int) var FRICTION = 500

enum {
	MOVE,
	ATTACK,
	ROLL
}

var velocity = Vector2.ZERO
var state = MOVE
var roll_vector
var stats = PlayerStats
var showed_ui = false

onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var swordHitbox = $HitBoxPivot/SwordHitBox
onready var hurtbox = $HurtBox
onready var ui_ = $UI

func _ready():
	if not OS.get_name() in ["Android", "iOS"]:
		ui_.add_child(preload("res://Overlap/MobileControls.tscn").instance())

	var _player_stats_connect = stats.connect("no_health", self, "queue_free")

	while (not DataManager.updated_data) and (not DataManager.exists_data("player")):
		yield(get_tree().create_timer(0.1), "timeout")

	var data = DataManager.get_data()
	var input_vector = str2var(data["player"]["facing"])

	animationTree.active = true
	roll_vector = input_vector
	swordHitbox.knockback_vector = input_vector
	animationTree.set("parameters/Idle/blend_position", input_vector)
	animationTree.set("parameters/Run/blend_position", input_vector)
	animationTree.set("parameters/Attack/blend_position", input_vector)
	animationTree.set("parameters/Roll/blend_position", input_vector)
	PlayerStats.health = data["player"]["health"]

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		ROLL:
			roll_state(delta)
		ATTACK:
			attack_state(delta)

	if DataManager.get_data()["player"]["location"] == "overworld":
		set_ui_visible(false)
		return
	
	set_ui_visible(true)

func move_state(delta):
	if not DataManager.updated_data:
		return

	var input_vector = Vector2.ZERO

	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	input_vector = input_vector.normalized()

	if input_vector != Vector2.ZERO:
		roll_vector = input_vector
		swordHitbox.knockback_vector = input_vector
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationTree.set("parameters/Roll/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	if Input.is_action_pressed("attack"):
		state = ATTACK

	if Input.is_action_pressed("roll"):
		state = ROLL

	move()

func attack_state(_delta):
	velocity = Vector2.ZERO
	animationState.travel("Attack")

func attack_animation_finish():
	state = MOVE

func move():
	velocity = move_and_slide(velocity)

func roll_state(_delta):
	velocity = roll_vector * ROLL_SPEED
	animationState.travel("Roll")
	move()

func roll_animation_finish():
	velocity = Vector2.ZERO
	state = MOVE

func _on_HurtBox_area_entered(area):
	stats.health -= area.damage
	hurtbox.start_invincibility(0.5)
	hurtbox.create_hit_effect()

	var playerHurtSound = PlayerHurtSound.instance()
	get_tree().current_scene.add_child(playerHurtSound)

func set_ui_visible(visible_: bool):
	ui_.visible = visible_
