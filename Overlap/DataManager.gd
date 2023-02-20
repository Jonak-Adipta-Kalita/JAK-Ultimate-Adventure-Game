extends Node2D

var file_path = "user://Data.json" if OS.get_name() in ["Android", "iOS"] else "Data.json"

var updated_data = false
var is_updating_ext_g_pos = false
var is_changing_floor = false
var inside_house = false

func check_for_file():
	var file = File.new()
	if file.file_exists(file_path):
		return
	file.open(file_path, File.WRITE_READ)
	file.store_string(JSON.print({
		"name": "Fox"
	}))
	file.close()

func get_data() -> Dictionary:
	var file = File.new()
	file.open(file_path, File.READ)
	var content = JSON.parse(file.get_as_text()).result
	file.close()

	return content

func set_data(data: Dictionary):
	var file = File.new()
	file.open(file_path, File.WRITE)
	file.store_string(JSON.print(data))
	file.close()

func modify_data(key: String, value):
	var content = get_data()
	content[key] = value

	set_data(content)

func exists_data(key: String) -> bool:
	var keys = Array(get_data().keys())

	if key in keys:
		return true

	return false

class ModifyData:
	static func player_data(
		global_pos: Vector2 = Vector2(90.4049, 345.182),
		facing: Vector2 = Vector2.DOWN,
		health: int = PlayerStats.max_health,
		location: String = "overworld",
		buildingexterior_global_pos: Vector2 = Vector2.ZERO,
		_floor = "GroundFloor"
	):
		var new_data: Dictionary = {}

		if buildingexterior_global_pos != Vector2.ZERO:
			new_data = {
				"global_position": var2str(global_pos),
				"facing": var2str(facing),
				"location": location,
				"health": health,
				"buildingexterior_global_pos": var2str(buildingexterior_global_pos),
				"floor": _floor
			}
		else:
			new_data = {
				"global_position": var2str(global_pos),
				"facing": var2str(facing),
				"location": location,
				"health": health
			}

		DataManager.modify_data("player", new_data)

	static func player_collection_data(
		bats_killed: int = 0,
		_exp: float = 0,
		crystals_collected: int = 0
	):
		var player_collection_data = {
			"bats_killed": bats_killed,
			"exp": _exp,
			"crystals_collected": crystals_collected
		}

		DataManager.modify_data("player_collection", player_collection_data)
	
	static func aiden_data(phase: int, task_asked: bool = false):
		DataManager.modify_data("aiden", {
			"phase": phase,
			"task_asked": task_asked
		})

func _ready():
	check_for_file()
