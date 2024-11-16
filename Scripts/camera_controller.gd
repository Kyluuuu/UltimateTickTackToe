extends Node2D

var zoomingIn = false

var camera

var currentButton

const zoomed_in = Vector2(2, 2)  # Zoom level for zooming in
const zoomed_out = Vector2(1, 1)  # Zoom level for zooming out

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera = $Camera2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if zoomingIn:
		zoomIn()
	else:
		zoomOut()

	
func zoomIn() -> void:
	var button_position: Vector2
	button_position = currentButton.global_position
	button_position.x += currentButton.size.x/2
	button_position.y += currentButton.size.y/2
	camera.global_position = camera.position.lerp(button_position, 0.05)
	camera.zoom = camera.zoom.lerp(zoomed_in, 0.05)
		
	var slideButton = $"BackControl"
	var locationBackButton = Vector2(button_position.x - 250, button_position.y - 38)
	slideButton.position = slideButton.position.lerp(locationBackButton, 0.05)
	
func zoomOut() -> void:
	camera.global_position = camera.position.lerp(Vector2(500, 320), 0.05)
	camera.zoom = camera.zoom.lerp(zoomed_out, 0.05)
	
	var slideButton = $"BackControl"
	slideButton.position = slideButton.position.lerp(Vector2(-400, 85), 0.05)


func _on_sliding_back_button_pressed():
	zoomingIn = false;
	currentButton.visible = true
	
func processButton(button):
	if currentButton != null:
		currentButton.visible = true
	currentButton = button
	zoomingIn = true;
	button.visible = false
	

func zoom_button_press(button : Button) -> void:
	processButton(button)
