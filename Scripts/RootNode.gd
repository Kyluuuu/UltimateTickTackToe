extends Node2D

# 0 : O, 1 : X
var playerTurn
var GameOver

func _ready() -> void:
	playerTurn = 0
	GameOver = false

func _process(delta: float) -> void:
	pass

func _updatePlayerTurn() -> void:
	var labelText = ""
	if playerTurn == 0:
		playerTurn = 1
		labelText = "X"
	else:
		playerTurn = 0
		labelText = "0"
	var label : Label = get_node("CameraController/Label")
	label.text = "Current Turn is : " + labelText
	
func _updatePlayerTurnToWin(winner : String) -> void:
	GameOver = true
	var label : Label = get_node("CameraController/Label")
	label.text = "Winner is : " + winner
	
func _updatePlayerTurnDraw() -> void:
	GameOver = true
	var label : Label = get_node("CameraController/Label")
	label.text = "Draw"

func _get_player_turn() -> int:
	return playerTurn
	
func getGameOver() -> bool:
	return GameOver
	
func test() -> void:
	GameOver = true
