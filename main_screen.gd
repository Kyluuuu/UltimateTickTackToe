extends Node2D

func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if myBool:
		moveCam()
	if unmyBool:
		unmoveCam()
		
func _input(event):

	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			get_tree().quit(0)
	pass;


func _on_button_pressed() -> void:
	var g = $Game
	g.use_parent_material = true;
	myBool = true
	unmyBool = false
	
	
func _on_sliding_back_button_pressed():
	var g = $Game
	g.use_parent_material = false;
	unmyBool = true
	myBool = false
	
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
	slideButton.position = slideButton.position.lerp(Vector2(67, 85), 0.18)
	
func unmoveCam() -> void:
	var camera = $Camera2D
	camera.global_position = camera.position.lerp(Vector2(500, 320), 0.05)
	camera.zoom = camera.zoom.lerp(zoomed_in, 0.05)
	
	var slideButton = $"Sliding back button"
	slideButton.position = slideButton.position.lerp(Vector2(-400, 85), 0.18)
