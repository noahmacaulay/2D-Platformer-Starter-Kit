extends Sprite2D

@onready var animation_player = $AnimationPlayer

func _ready():
	GameManager.connect("laugh", self._on_laugh)
	
func _on_laugh():
	animation_player.play("laugh")
