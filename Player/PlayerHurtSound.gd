extends AudioStreamPlayer

func _ready():
	var _finished_connect = connect("finished", self, "queue_free")
