extends Node2D

# 0 : O, 1 : X
var playerTurn

func _ready() -> void:
	playerTurn = 0

func _process(delta: float) -> void:
	pass

func _updatePlayerTurn() -> void:
	if playerTurn == 0:
		playerTurn = 1
	else:
		playerTurn = 0

func _get_player_turn() -> int:
	return playerTurn
	
func hello() -> void:
	print("hello")
