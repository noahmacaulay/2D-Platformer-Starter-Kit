extends Sprite2D

@onready var animation_player = $AnimationPlayer

func _ready():
	GameManager.connect("troll_laugh", self._on_laugh)
	
func _on_laugh():
	animation_player.play("laugh")

func call_shake():
	GameManager.shake_camera(0.5)
