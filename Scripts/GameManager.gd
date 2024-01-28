# This script is an autoload, that can be accessed from any other script!

extends Node2D

signal shakecam(trauma)
signal troll_laugh
signal show_joke(text)

var score : int = 0

# Adds 1 to score variable
func add_score():
	score += 1
	emit_signal('troll_laugh')
	joke()

func reset_score():
	score = 0
# Loads next level
func load_next_level(next_scene : PackedScene):
	get_tree().change_scene_to_packed(next_scene)

func shake_camera(trauma):
	emit_signal('shakecam', trauma)

func joke():
	var jokes = ["Have you heard the one about the sheep? You have?",
	"When I got up this morning, I had hope!",
	"Why did the chicken cross the road? Uh... I forget...",
	"Where does France keep its armies? In its sleevies!","What do you call a well-balanced horse? Stable.",
	"What do you call an angry carrot? A steamed veggie.",
	"What do you call a pile of cats? A meow-ntain.",
	"Why do cows wear bells? Because their horns don’t work."]
	var n = randi_range(0, len(jokes) - 1)
	emit_signal("show_joke", jokes[n])
