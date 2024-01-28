# This script is an autoload, that can be accessed from any other script!

extends Node2D

signal shakecam(trauma)
signal troll_laugh
signal show_joke(text)

var jokes = ["Where does France keep its armies? In its sleevies!",
"What do you call a well-balanced horse? Stable.",
"How does a bird break into a bird feeder? With a crowbar.",
"What kind of tree fits in your hand? A palm tree.",
"What do you call a sleeping bull? A bull-dozer.",
"What is a monster’s favorite dessert? I scream.",
"How do we know that the ocean is friendly? It waves!",
"Why was the computer cold? It had a virus.",
"What do you call a drugstore for cats? A-paw-thecary!",
"Why don't fish go to work? Because they're still in school!",
"Why doesn't Indiana Jones like coding? He's afraid of pythons!",
"What do you call a vampire who codes? Stackula",
"What did the ocean say to the beach? Nothing, it just waved",
"How does the moon cut his hair? Eclipse it",
"Where do fruits go on vacation? Pear-is",
"Why did the corn-cob get lost? He was in a maize",
"Where do boats go when they're sick? To the dock!",
"How do you get a squirrel to like you? Act like a nut",
"Why don't eggs tell jokes? They'd crack each other up",
"I heard a joke about boxing, but there was no punch line",
"What do you call an angry carrot? A steamed veggie.",
"What do you call a pile of cats? A meow-ntain.",
"Why do cows wear bells? Because their horns don’t work.",
"How do bees brush their hair? With honeycombs",
"What do you call a nose with no body? Nobody nose"]

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

var unselected_joke_indices = range(len(jokes))

func joke():
	var idx = 0
	if len(unselected_joke_indices) != 0:
		var k = randi_range(0, len(unselected_joke_indices) - 1)
		idx =  unselected_joke_indices[k]
		unselected_joke_indices.remove_at(k)
	else:
		idx = randi_range(0, len(jokes) - 1)
	emit_signal("show_joke", jokes[idx])
