extends Control

#0 for O, 1 for X, 2 for nothing
var tileState = []
var currentTurn = 0

var gameID : int

var buttons = []
var winningCombinations = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	highlight()
	tileState = [2, 2, 2, 2, 2, 2, 2, 2, 2]
	
	gameID = get_node(".").get_parent().get_parent().get_meta("Mini")
	
	winningCombinations.append([0, 1, 2])
	winningCombinations.append([3, 4, 5])
	winningCombinations.append([6, 7, 8])
	winningCombinations.append([0, 3, 6])
	winningCombinations.append([1, 4, 7])
	winningCombinations.append([2, 5, 8])
	winningCombinations.append([0, 4, 8])
	winningCombinations.append([6, 4, 2])
	
	for button in get_node("GridContainer").get_children():
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
	
func gameFinished(playerTurn : int) -> void:
	var node = get_tree().current_scene.get_node("Game")
	node._game_result(playerTurn, gameID)
	
func nextMiniGame(index : int) -> void:
	var node = get_tree().current_scene.get_node("Game")
	node._miniGameHighlight(index + 1, gameID)

func highlight() -> void:
	var colorNode : ColorRect = get_parent().get_parent().get_node("ColorRect")
	colorNode.color = Color.PURPLE
	
func unhighlight() -> void:
	var colorNode : ColorRect = get_parent().get_parent().get_node("ColorRect")
	colorNode.color = Color.WHITE
	
	
func processButton(index : int) -> void:
	var chosenGame = get_tree().current_scene.get_node("Game").getCurrentChosenGame()
	if chosenGame == -1 or chosenGame == gameID:
		if tileState[index] == 2:
			var playerTurn = changeButtonText(buttons[index])
			tileState[index] = playerTurn
			if checkForWin(playerTurn):
				var button : Button = get_child(1)
				var label : Label = get_child(3)
				var grey : ColorRect = get_child(2)
				button.visible = true
				grey.visible = true
				grey.modulate.a = 0.5;
				button.disabled = true
				if playerTurn == 0:
					label.text = "0"
				else:
					label.text = "X"
				gameFinished(playerTurn)
			nextMiniGame(index)
	else :
		return
	
func changeButtonText(button : Button) -> int:
	var gameNode = get_node("/root/RootNode")
	var playerTurn = gameNode. _get_player_turn()
	gameNode._updatePlayerTurn()
	if playerTurn == 0:
		button.text = "0"
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

func _on_zoom_in_button_9_pressed():
	var node = get_tree().current_scene.get_node("CameraController")
	node.zoom_button_press(get_node("ZoomInButton9"))
