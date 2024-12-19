extends Area2D

signal hexagon_hit
signal hexagon_score

var speed = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scale = Vector2(100.0, 100.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scale.x -= speed * delta
	scale.y = scale.x
	
	if scale.x < 1:
		hexagon_score.emit()
		queue_free()


func _on_area_entered(_area: Area2D) -> void:
	hexagon_hit.emit()
