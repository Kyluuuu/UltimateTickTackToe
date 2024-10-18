extends Button

var myBool = false
var unmyBool = false

var camera : Camera2D

const zoomed_out = Vector2(1, 1)  # Zoom level for zooming in
const zoomed_in = Vector2(2, 2)  # Zoom level for zooming out

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera = get_node("/root/Node2D/Camera2D")
	modulate.a = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if myBool:
		moveCam()
	if unmyBool:
		unmoveCam()

func _on_pressed() -> void:
	if !myBool:
		myBool = true
		unmyBool = false
	else:
		unmyBool = true
		myBool = false
	
func moveCam() -> void:
	var button_position = global_position
	button_position.x += size.x/2
	button_position.y += size.y/2
	camera.global_position = camera.position.lerp(button_position, 0.05)
	camera.zoom = camera.zoom.lerp(zoomed_in, 0.05)
		
func unmoveCam() -> void:
	camera.global_position = camera.position.lerp(Vector2(500, 320), 0.05)
	camera.zoom = camera.zoom.lerp(zoomed_out, 0.05)
