extends Node2D

onready var player = $YSort/Player

func _ready():
	PauseMenu.can_pause = true
	DataManager.modify_data("location", "buildinginterrior-" + name)
