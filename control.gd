extends Control

#0 for O, 1 for X, 2 for nothing
var tileState
var currentTurn = 0
var xAmount = 0
var oAmount = 0

var buttons = []
var winningCombinations = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tileState = [2, 2, 2, 2, 2, 2, 2, 2, 2]
	
	winningCombinations.append([0, 1, 2])
	winningCombinations.append([3, 4, 5])
	winningCombinations.append([6, 7, 8])
	winningCombinations.append([0, 3, 6])
	winningCombinations.append([1, 4, 7])
	winningCombinations.append([2, 5, 8])
	winningCombinations.append([0, 4, 8])
	winningCombinations.append([6, 4, 2])
	
	for button in get_tree().get_nodes_in_group("Game9Buttons"):
		buttons.append(button)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_0_pressed() -> void:
	var index = 0
	processButton(index)
	
func _on_button_1_pressed() -> void:
	var index = 1
	processButton(index)
	
func _on_button_2_pressed() -> void:
	var index = 2
	processButton(index)
	
func _on_button_3_pressed() -> void:
	var index = 3
	processButton(index)
	
func _on_button_4_pressed() -> void:
	var index = 4
	processButton(index)
	
func _on_button_5_pressed() -> void:
	var index = 5
	processButton(index)
	
func _on_button_6_pressed() -> void:
	var index = 6
	processButton(index)
	
func _on_button_7_pressed() -> void:
	var index = 7
	processButton(index)
	
func _on_button_8_pressed() -> void:
	var index = 8
	processButton(index)
	
func processButton(index : int) -> void:
	if tileState[index] == 2:
		var playerTurn = changeButtonText(buttons[index], index)
		tileState[index] = playerTurn
		if checkForWin(playerTurn):
			var button : Button = get_tree().get_nodes_in_group("ZoomInButtons")[8]
			button.visible = true
			button.modulate.a = 1
			if playerTurn == 0:
				button.text = "O"
			else:
				button.text = "X"
		else:
			print("Already pressed!")
	
func changeButtonText(button : Button, index : int) -> int:
	var gameNode = get_node("/root/Node2D")
	var playerTurn = gameNode. _get_player_turn()
	gameNode._updatePlayerTurn()
	if playerTurn == 0:
		button.text = "O"
	else:
		button.text = "X"
	return playerTurn
	
func checkForWin(turn : int) -> bool:
	for combination in winningCombinations:
		var isWin = true
		for j in range(3):
			if tileState[combination[j]] != turn:
				isWin = false
		if isWin:
			return isWin
	return false
