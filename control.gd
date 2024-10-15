extends Control

#0 for nothing, 1 for crosses, 2 for circles
var tileState

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tileState = [0, 0, 0, 0, 0, 0, 0, 0, 0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
