extends Node2D

var myBool = false
var unmyBool = false

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
	if !myBool:
		myBool = true
		unmyBool = false
	else:
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
		
func unmoveCam() -> void:
	var camera = $Camera2D
	print("asdas")
	camera.global_position = camera.position.lerp(Vector2(575, 375), 0.05)
