extends Node

@export var game_scene: PackedScene
@export var home_screen_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HomeScreen.home_screen_button_pressed.connect(create_game)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func create_game():
	for child in get_children():
		child.queue_free()
	
	var game = game_scene.instantiate()
	add_child(game)
	game.game_over.connect(create_home_screen)
	

func create_home_screen():
	for child in get_children():
		child.queue_free()
	
	var home_screen = home_screen_scene.instantiate()
	add_child(home_screen)
	home_screen.home_screen_button_pressed.connect(create_game)
