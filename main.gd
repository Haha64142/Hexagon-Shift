extends Node

@export var game_scene: PackedScene
@export var home_screen_scene: PackedScene
var difficulty = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HomeScreen.home_screen_play_button_pressed.connect(create_game)
	$HomeScreen.difficulty = difficulty
	$HomeScreen.get_button_pressed_from_difficulty()
	$HomeScreen._ready()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func create_game():
	difficulty = get_child(0).difficulty
	for child in get_children():
		child.queue_free()
	
	var game = game_scene.instantiate()
	add_child(game)
	game.game_over.connect(create_home_screen)
	game.difficulty = difficulty
	game.start_game()
	

func create_home_screen():
	difficulty = get_child(0).difficulty
	for child in get_children():
		child.queue_free()
	
	var home_screen = home_screen_scene.instantiate()
	add_child(home_screen)
	home_screen.home_screen_play_button_pressed.connect(create_game)
	home_screen.difficulty = difficulty
	home_screen.get_button_pressed_from_difficulty()
	home_screen._ready()
