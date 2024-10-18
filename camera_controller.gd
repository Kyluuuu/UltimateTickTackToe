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
	
func processButton(button):
	if currentButton != null:
		currentButton.visible = true
	currentButton = button
	zoomingIn = true;
	button.visible = false
	


func _on_zoom_in_button_1_pressed() -> void:
	var button = get_tree().get_nodes_in_group("ZoomInButtons")[0]  
	processButton(button)

func _on_zoom_in_button_2_pressed() -> void:
	var button = get_tree().get_nodes_in_group("ZoomInButtons")[1]  
	processButton(button)
	
	
func _on_zoom_in_button_3_pressed() -> void:
	var button = get_tree().get_nodes_in_group("ZoomInButtons")[2]  
	processButton(button)


func _on_zoom_in_button_4_pressed() -> void:
	var button = get_tree().get_nodes_in_group("ZoomInButtons")[3]  
	processButton(button)


func _on_zoom_in_button_5_pressed() -> void:
	var button = get_tree().get_nodes_in_group("ZoomInButtons")[4]  
	processButton(button)
	

func _on_zoom_in_button_6_pressed() -> void:
	var button = get_tree().get_nodes_in_group("ZoomInButtons")[5]  
	processButton(button)


func _on_zoom_in_button_7_pressed() -> void:
	var button = get_tree().get_nodes_in_group("ZoomInButtons")[6]  
	processButton(button)


func _on_zoom_in_button_8_pressed() -> void:
	var button = get_tree().get_nodes_in_group("ZoomInButtons")[7]  
	processButton(button)


func _on_zoom_in_button_9_pressed() -> void:
	var button = get_tree().get_nodes_in_group("ZoomInButtons")[8]  
	processButton(button)
