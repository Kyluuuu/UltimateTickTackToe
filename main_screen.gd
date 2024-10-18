extends Node2D

# 0 : X, 1 : O
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
