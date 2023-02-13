extends YSort

onready var bats = $YSort/Bats

onready var bottomRight = $Position/BottomRight.position
onready var topLeft = $Position/TopLeft.position

func _ready():
	randomize()

	for _i in range(50):
		spawn()

func spawn():
	var size = bottomRight - topLeft
	var random_x = topLeft.x + size.x * randf()
	var random_y = topLeft.y + size.y * randf()

	var bat = preload("res://Enemies/Bat.tscn").instance()
	bat.position = Vector2(random_x, random_y)
	bats.add_child(bat)
