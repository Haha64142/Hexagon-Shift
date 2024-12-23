extends Area2D

var rotate_speed = 450
var prev_swap_sides = false
var swap_sides = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation_degrees = -90


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var rotate_left = Input.is_action_pressed("rotate_left")
	var rotate_right = Input.is_action_pressed("rotate_right")
	swap_sides = Input.is_action_pressed("swap_sides")

	if rotate_left and rotate_right:
		swap_sides = true
	
	if rotate_left:
		rotation_degrees -= rotate_speed * delta
	
	if rotate_right:
		rotation_degrees += rotate_speed * delta
	
	if swap_sides and !prev_swap_sides:
		rotation_degrees += 180
	
	prev_swap_sides = swap_sides
	
	notification(NOTIFICATION_DRAW)
	
func _draw():
	draw_circle($CollisionShape2D.position, 8.0, Color.hex(0xAFA200FF))
