extends Control

#0 for nothing, 1 for crosses, 2 for circles
var tileState

var buttons = []
var callables = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tileState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
	callables.append(_on_button_0_pressed)
	callables.append(_on_button_1_pressed)
	callables.append(_on_button_2_pressed)
	callables.append(_on_button_3_pressed)
	callables.append(_on_button_4_pressed)
	callables.append(_on_button_5_pressed)
	callables.append(_on_button_6_pressed)
	callables.append(_on_button_7_pressed)
	callables.append(_on_button_8_pressed)
	
	for button in get_tree().get_nodes_in_group("Game9Buttons"):
		buttons.append(button)
		print("help")
		var callable = _on_button_0_pressed
		button.connect("pressed", callables[0])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_0_pressed() -> void:
	print(1000)
	
func _on_button_1_pressed() -> void:
	print(1000)
	
func _on_button_2_pressed() -> void:
	print(1000)
	
func _on_button_3_pressed() -> void:
	print(1000)
	
func _on_button_4_pressed() -> void:
	print(1000)
	
func _on_button_5_pressed() -> void:
	print(1000)
	
func _on_button_6_pressed() -> void:
	print(1000)
	
func _on_button_7_pressed() -> void:
	print(1000)
	
func _on_button_8_pressed() -> void:
	print(1000)
