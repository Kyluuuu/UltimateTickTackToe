extends Node2D

var myBool = false
var unmyBool = false

const zoomed_in = Vector2(1, 1)  # Zoom level for zooming in
const zoomed_out = Vector2(2, 2)  # Zoom level for zooming out

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if myBool:
		moveCam()
	if unmyBool:
		unmoveCam()


func _on_button_pressed() -> void:
	myBool = true
	unmyBool = false
	
func moveCam() -> void:
	var button = get_node("Button")
	var button_position: Vector2
	button_position = button.global_position
	button_position.x += button.size.x/2
	button_position.y += button.size.y/2
	var camera = $Camera2D
	camera.global_position = camera.position.lerp(button_position, 0.05)
	camera.zoom = camera.zoom.lerp(zoomed_out, 0.05)
		
	var slideButton = $"Sliding back button"
	slideButton.position = slideButton.position.lerp(Vector2(67, 85), 0.05)
	
func unmoveCam() -> void:
	var camera = $Camera2D
	camera.global_position = camera.position.lerp(Vector2(500, 320), 0.05)
	camera.zoom = camera.zoom.lerp(zoomed_in, 0.05)
	
	var slideButton = $"Sliding back button"
	slideButton.position = slideButton.position.lerp(Vector2(-400, 85), 0.05)


func _on_sliding_back_button_pressed():
	unmyBool = true
	myBool = false
