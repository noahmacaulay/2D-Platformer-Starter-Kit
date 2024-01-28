extends Sprite2D

@onready var animation_player = $AnimationPlayer
@onready var laugh_player = $LaughPlayer
@onready var lower_laugh_player = $LowerLaughPlayer
var serious_sprite = preload("res://Assets/Textures/Troll_3.png")
var laughing_sprite = preload("res://Assets/Textures/Troll_1.png")

func _ready():
	GameManager.connect("troll_laugh", self._on_laugh)
	
func _on_laugh():
	texture = laughing_sprite
	animation_player.play("laugh")

func call_shake_first():
	GameManager.shake_camera(0.5)
	laugh_player.play()

func call_shake():
	GameManager.shake_camera(0.5)
	lower_laugh_player.play()

func _on_laugh_end():
	texture = serious_sprite
