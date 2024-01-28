extends RigidBody2D

@onready var animation_player = $AnimationPlayer

func _on_timer_timeout():
	animation_player.play("fade out")
