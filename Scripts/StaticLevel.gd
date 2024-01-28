extends Node2D

var boulder_tscn = preload("res://Scenes/Prefabs/Boulder.tscn")

func _ready():
	GameManager.connect('troll_laugh', self.make_boulders)
	
func make_boulders():
	for i in range(3):
		var new_b = boulder_tscn.instantiate()
		add_child(new_b)
		new_b.position = Vector2(randf_range(-416, 416), -1450)
