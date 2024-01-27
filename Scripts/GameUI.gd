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
	animation_player.play("display_joke")
