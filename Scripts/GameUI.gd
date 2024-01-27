extends Control

@onready var score_texture = %Score/ScoreTexture
@onready var score_label = %Score/ScoreLabel

@onready var joke_display = $Panel/JokeDisplay
@onready var animation_player = $Panel/AnimationPlayer


func _ready():
	GameManager.connect("show_joke", self._on_show_joke)

func _process(_delta):
	# Set the score label text to the score variable in game maanger script
	score_label.text = "x %d" % GameManager.score

func _on_show_joke(in_text):
	joke_display.text = in_text
	if !animation_player.is_playing():
		animation_player.play("display_joke")
	elif animation_player.current_animation_position > 1.0 && animation_player.current_animation_position < 7.0:
		animation_player.seek(1.0)
