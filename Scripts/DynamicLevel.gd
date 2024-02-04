extends Node2D


@onready var plat_scene = preload("res://Scenes/Prefabs/Platform.tscn")
@onready var scroll_scene = preload("res://Scenes/Prefabs/Scroll.tscn")

var time = 0
var timeDirection = 1
var moveDuration = 2
var destination: Vector2 = Vector2.ZERO
@export var speed = 50
var num_vertical_platforms = 7
var timer : Timer = null

func _ready():
	generate_platforms(Vector2(-480, -544))
	generate_platforms(Vector2(-480, -1440))
	GameManager.connect('troll_laugh', self.move_down)

func _process(delta):
	position = position.move_toward(destination, delta * speed)
	if position == destination:
		readjust()

func generate_platforms(starting_pos : Vector2):
	randomize()
	var locations_x = range(6)
	var locations_y = range(8)
	locations_x.shuffle()
	locations_y.shuffle()
	locations_y.pop_back()
	var scroll_i = [randi_range(0, len(locations_y) - 1)]
	scroll_i.append((scroll_i[0]+randi_range(1, len(locations_y) - 1)) % len(locations_y))
	for i in range(len(locations_y)):
		var new_plat : Node2D = plat_scene.instantiate()
		call_deferred('add_child',new_plat)
		var pos : Vector2 = starting_pos
		pos.x += 126 + locations_x[i%len(locations_x)] * 150
		pos.y += locations_y[i] * 128
		new_plat.position = pos
		if i in scroll_i:
			var new_scroll : Node2D = scroll_scene.instantiate()
			new_plat.add_child(new_scroll)
			new_scroll.position.y -= 80

func readjust():
	var nodes = get_children()
	for n in nodes:
		if n is Node2D:
			n.position += position
			if n.position.y > 895:
				remove_child(n)
				n.queue_free()
	position = Vector2.ZERO
	destination = Vector2.ZERO

func move_down():
	if timer != null:
		move_down_execute()
		return
	timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", self.move_down_execute)
	timer.start(3.0)

func move_down_execute():
	if timer && !timer.time_left:
		remove_child(timer)
		timer.queue_free()
		timer = null
	destination.y += 448
	if roundi(destination.y) % 896 == 0:
		generate_platforms(Vector2(-480, -destination.y - 1440))
