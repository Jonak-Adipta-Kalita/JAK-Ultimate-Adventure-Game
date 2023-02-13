extends YSort

onready var bats = $YSort/Bats

onready var bottomRight = $Position/BottomRight.position
onready var topLeft = $Position/TopLeft.position

var can_interract = false
var counter = 1

func _ready():
	randomize()

	for _i in range(50):
		spawn()

func spawn():
	counter += 1
	print("boom", counter)
	var size = bottomRight - topLeft
	var random_x = topLeft.x + size.x * randf()
	var random_y = topLeft.y + size.y * randf()

	var bat = preload("res://Enemies/Bat.tscn").instance()
	bat.position = Vector2(random_x, random_y)
	bats.add_child(bat)

func _on_ComputerInterractable_body_entered(_body):
	can_interract = true

func _on_ComputerInterractable_body_exited(_body):
	can_interract = false

func _process(_delta):
	if can_interract and Input.is_action_just_pressed("ui_select"):
		spawn()
