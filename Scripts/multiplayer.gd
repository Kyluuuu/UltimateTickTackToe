extends Node2D

@onready var HostPort : LineEdit = $Node2D/lineEditHost
@onready var JoinPort : LineEdit = $Node2D/LineEditJoinPort
@onready var JoinIp : LineEdit = $Node2D/LineEditJoinIP
@onready var label : Label = $Node2D/Label

var serverMade = false
var joined = false

var numPlayers = 0

func _ready() -> void:
	$MainScreenNode.hide()
	pass

func _process(delta: float) -> void:
	pass


func _on_host_button_pressed() -> void:
	if serverMade:
		label.text = "Already hosting"
		return
	
	var hport = HostPort.text
	
	if not hport.is_valid_int():
		label.text = "Invalid host port"
		return
	
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(int(hport), 1)
	multiplayer.multiplayer_peer = peer
	label.text = "Now hosting on " + hport
	serverMade = true
	$Node2D.hide()
	$MainScreenNode.show()
	
func _on_join_button_pressed() -> void:
	if joined:
		label.text = "Already joining"
		return 
	
	var jport = JoinPort.text
	var jIP = JoinIp.text
	
	if jIP == "":
		jIP = "localhost"
	
	if not jport.is_valid_int():
		label.text = "Invalid join port"
		return
		
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(jIP, int(jport))
	multiplayer.multiplayer_peer = peer
	label.text = "Now joining " + jIP + " on " + jport
	joined = true
	$Node2D.hide()
	$MainScreenNode.show()
	print("trying to join!")
	
	
	
	
