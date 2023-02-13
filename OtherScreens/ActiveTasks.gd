extends CanvasLayer

onready var task1 = $Tasks/Task1
onready var task2 = $Tasks/Task2

onready var doneTask1 = $TaskDone/DoneTask1
onready var doneTask2 = $TaskDone/DoneTask2

var can_be_viewed = false

func no_tasks():
	doneTask1.visible = false
	doneTask2.visible = false
	task1.text = "No Tasks Currently!!"
	task2.text = ""

func _process(_delta):
	visible = can_be_viewed

	if not DataManager.exists_data("aiden"):
		no_tasks()
		return

	var player_collection_data = DataManager.get_data()["player_collection"]
	var aiden_data = DataManager.get_data()["aiden"]

	if aiden_data["phase"] == 2 and aiden_data["task_asked"] == true:
		doneTask1.visible = false
		doneTask2.visible = false

		if player_collection_data["bats_killed"] >= 50:
			doneTask1.visible = true
		if player_collection_data["exp"] >= 250:
			doneTask1.visible = true
		
		if player_collection_data["bats_killed"] >= 50 and player_collection_data["exp"] >= 250:
			doneTask1.visible = false
			doneTask2.visible = false
			task1.text = "Go back to Aiden!!"
			task2.text = ""

			return

		task1.text = "1) %s" % "Kill %d/50 Bats" % player_collection_data["bats_killed"]
		task2.text = "2) %s" % "Collect %d/250 ExP" % player_collection_data["exp"]
	elif aiden_data["phase"] == 3 and aiden_data["task_asked"] == true:
		doneTask1.visible = false
		doneTask2.visible = false

		if player_collection_data["crystals_collected"] >= 100:
			doneTask1.visible = true
		if player_collection_data["exp"] >= 500:
			doneTask2.visible = true

		if player_collection_data["crystals_collected"] >= 100 and player_collection_data["exp"] >= 500:
			doneTask1.visible = false
			doneTask2.visible = false
			task1.text = "Go back to Aiden!!"
			task2.text = ""

			return

		task1.text = "1) %s" % "Collect %d/100 Crystals" % player_collection_data["crystals_collected"]
		task2.text = "2) %s" % "Collect %d/500 ExP" % player_collection_data["exp"]
	else:
		no_tasks()
