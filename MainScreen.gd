extends Node2D
# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().quit(0);
	
func _input(ev):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit(0);


func _on_button_2_pressed():
	pass;

func _on_button_3_pressed():
	pass;
