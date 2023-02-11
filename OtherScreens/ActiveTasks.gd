extends CanvasLayer

onready var task1 = $Tasks/Task1
onready var task2 = $Tasks/Task2

var can_be_viewed = false

func no_tasks():
	task1.text = "No Tasks Currently!!"
	task2.text = ""

func _process(_delta):
	visible = can_be_viewed

	if not "aiden" in DataManager.get_data():
		no_tasks()
		return

	var player_data = DataManager.get_data()["player"]
	var aiden_data = DataManager.get_data()["aiden"]

	if aiden_data["phase"] == 2 and aiden_data["task_asked"] == true:
		task1.text = "1) %s" % "Kill %d/50 Bats" % player_data["bats_killed"]
		task2.text = "2) %s" % "Collect %d/100 ExP" % player_data["exp"]
	else:
		no_tasks()
