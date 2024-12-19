extends Node

signal game_over

@export var hexagon_scene: PackedScene
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score = 0
	$Score.text = str(score)
	$Score.show()
	$HexagonTimer.wait_time = 1.5
	$HexagonTimer.start()
	$Message.hide()
	Input.action_release("rotate_left")
	Input.action_release("rotate_right")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_hexagon_timer_timeout() -> void:
	var hexagon = hexagon_scene.instantiate()
	add_child(hexagon)
	hexagon.add_to_group("hexagons")
	
	hexagon.hexagon_hit.connect(_on_hexagon_hit)
	hexagon.hexagon_score.connect(_on_hexagon_score)
	hexagon.rotation_degrees = randi_range(0, 5) * 60

func _on_hexagon_hit():
	print("Game Over")
	$HexagonTimer.stop()
	get_tree().call_group("hexagons", "queue_free")
	$Message.text = "Game Over"
	$Message.show()
	
	await get_tree().create_timer(2.0).timeout
	game_over.emit()
	
func _on_hexagon_score():
	score += 1
	$Score.text = str(score)
	var new_wait_time = $HexagonTimer.wait_time - 0.01
	if new_wait_time >= 0.1:
		$HexagonTimer.wait_time = new_wait_time


func _on_rotate_left_pressed() -> void:
	Input.action_press("rotate_left")
	
func _on_rotate_left_released() -> void:
	Input.action_release("rotate_left")
	

func _on_rotate_right_pressed() -> void:
	Input.action_press("rotate_right")

func _on_rotate_right_released() -> void:
	Input.action_release("rotate_right")
