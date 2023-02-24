extends CanvasLayer

var showing_text = false
onready var label = $Label

const MAP_PLAYER_MOBILECONTROLS_PATH = "/root/Map/StopOnPause/GreenHaven/YSort/Player/UI/MobileControls"

func _ready():
	visible = false

func toggle_visibility(to_do: bool):
	var player_data = DataManager.get_data()["player"]
	var mobileControls = get_node(MAP_PLAYER_MOBILECONTROLS_PATH) if player_data["location"] == "overworld" else get_node("/root/" +  player_data["location"].split("-")[1] + "_" + player_data["floor"] + "/YSort/Player/UI/MobileControls")

	mobileControls.analog.visible = to_do
	mobileControls.killButton.visible = to_do
	mobileControls.rollButton.visible = to_do

func send_message(message: String):
	if not showing_text:
		if OS.get_name() in ["Android", "iOS", "Windows"]:
			toggle_visibility(false)
		visible = true
		label.text = message
		showing_text = true
	else:
		if OS.get_name() in ["Android", "iOS", "Windows"]:
			toggle_visibility(true)
		showing_text = false
		label.text = ""
		visible = false
