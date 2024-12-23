extends Node

signal home_screen_play_button_pressed

var selected_theme = preload("res://button_selected_theme.tres")
var standard_theme = preload("res://button_standard_theme.tres")
var difficulty

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("rotate_left"):
		difficulty += 2
		get_button_pressed_from_difficulty()
	
	if Input.is_action_just_pressed("rotate_right"):
		difficulty += 1
		get_button_pressed_from_difficulty()
	

func get_button_pressed_from_difficulty():
	difficulty = difficulty % 3
	if difficulty == 0:
		_on_easy_pressed()
	elif difficulty == 1:
		_on_normal_pressed()
	elif difficulty == 2:
		_on_hard_pressed()


func _on_play_button_pressed() -> void:
	home_screen_play_button_pressed.emit()
	

func _on_easy_pressed() -> void:
	$Easy.theme = selected_theme
	$Normal.theme = standard_theme
	$Hard.theme = standard_theme
	difficulty = 0
	

func _on_normal_pressed() -> void:
	$Easy.theme = standard_theme
	$Normal.theme = selected_theme
	$Hard.theme = standard_theme
	difficulty = 1
	

func _on_hard_pressed() -> void:
	$Easy.theme = standard_theme
	$Normal.theme = standard_theme
	$Hard.theme = selected_theme
	difficulty = 2
