extends Camera2D

# adapted from https://kidscancode.org/godot_recipes/3.x/2d/screen_shake/index.html

@export var decay = 0.8  # How quickly the shaking stops [0, 1].
@export var max_offset = Vector2(100, 75)  # Maximum hor/ver shake in pixels.

var trauma = 0.0  # Current shake strength.
var trauma_power = 2  # Trauma exponent. Use [2, 3].
var init_offset : Vector2

func _ready():
	randomize()
	GameManager.connect('shakecam', self.add_trauma)
	init_offset = offset

func add_trauma(amount):
	trauma = min(trauma + amount, 1.0)

func _process(delta):
	if trauma:
		trauma = max(trauma - decay * delta, 0)
		shake()

func shake():
	var amount = pow(trauma, trauma_power)
	offset.x = max_offset.x * amount * randf_range(-1, 1) + init_offset.x
	offset.y = max_offset.y * amount * randf_range(-1, 1) + init_offset.y
