extends Node2D

var file_path = "Data.json"

func check_for_file():
	var file = File.new()
	file.open(file_path, File.WRITE_READ)
	file.store_string("{}")
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

func _ready():
	check_for_file()
