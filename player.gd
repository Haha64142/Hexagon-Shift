extends Area2D

var rotate_speed = 450

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation_degrees = -90


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("rotate_left"):
		rotation_degrees -= rotate_speed * delta
	
	if Input.is_action_pressed("rotate_right"):
		rotation_degrees += rotate_speed * delta
	
	notification(NOTIFICATION_DRAW)
	
func _draw():
	draw_circle($CollisionShape2D.position, 8.0, Color.hex(0xAFA200FF))
