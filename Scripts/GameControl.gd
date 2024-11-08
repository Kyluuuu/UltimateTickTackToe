extends Control

#0 for O, 1 for X, 2 for nothing
var tileState
var currentTurn = 0
var xAmount = 0
var oAmount = 0

var buttons = []
var winningCombinations = []
var gameStates = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gameStates = [2, 2, 2, 2, 2, 2, 2, 2, 2]
	
	winningCombinations.append([0, 1, 2])
	winningCombinations.append([3, 4, 5])
	winningCombinations.append([6, 7, 8])
	winningCombinations.append([0, 3, 6])
	winningCombinations.append([1, 4, 7])
	winningCombinations.append([2, 5, 8])
	winningCombinations.append([0, 4, 8])
	winningCombinations.append([6, 4, 2])
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _game_result(winner : int, miniID : int) -> void:
	gameStates[miniID - 1] = winner
	var result = checkForWin(winner)
	if result:
		var label : Label = get_node("BeegLabel")
		print(winner)
		if winner == 1:
			label.text = "X"
		else:
			label.text = "0"
		var grey : ColorRect = get_node("DaGrey")
		grey.visible = true
		grey.modulate.a = 0.5;

func checkForWin(turn : int) -> bool:
	for combination in winningCombinations:
		var isWin = true
		for j in range(3):
			if gameStates[combination[j]] != turn:
				isWin = false
		if isWin:
			return isWin
	return false
