extends CanvasLayer

onready var task1 = $Tasks/Task1
onready var task2 = $Tasks/Task2

var can_be_viewed = false

func _process(_delta):
	visible = can_be_viewed

	if not "aiden" in DataManager.get_data():
		task1.text = "No Tasks Currently!!"
		return

	task1.text = "1) %s" % "Kill %d/50 Bats" % 30
	task2.text = "2) %s" % "Collect %d/100 ExP" % 20
