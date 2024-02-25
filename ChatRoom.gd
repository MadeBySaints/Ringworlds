# ChatRoom.gd
extends Node

const PORT = 12345
const MAX_CLIENTS = 4

var server: NetworkedMultiplayerENet
var client: NetworkedMultiplayerENet

var username: String = "Guest"
var messages: Array = []

onready var chat_history: RichTextLabel = $ChatHistory
onready var input_text: LineEdit = $InputText

func _ready():
    if get_tree().has_network_peer():
        # We are a client
        client = get_tree().get_network_peer()
        username = client.get("username")
        set_process_input(true)
        set_process(true)
    else:
        # We are the server
        server = NetworkedMultiplayerENet.new()
        server.create_server(PORT, MAX_CLIENTS)
        set_process(true)

func _input(event):
    if event is InputEventKey and event.pressed and event.scancode == KEY_ENTER:
        if client:
            # Send the message to the server
            var message = input_text.text
            input_text.text = ""
            rpc_id(1, "add_message", username + ": " + message)
        else:
            # Add the message to the server's chat history
            add_message(username + ": " + input_text.text)
            input_text.text = ""

func _process(delta):
    if server:
        # Broadcast chat history to clients
        rpc("set_chat_history", messages)
    
    while client and client.get_rpc_packet().get_type() == MultiplayerAPI.RPC_MODE_REMOTE:
        # Receive chat history from server
        var message = client.get_rpc_packet().get_var()
        add_message(message)

func add_message(message: String):
    messages.append(message)
    chat_history.text = messages.join("\n")

func set_chat_history(chat_history: Array):
    messages = chat_history
    chat_history.text = messages.join("\n")

func join(username: String):
    if client:
        return
        
    client = NetworkedMultiplayerENet.new()
    client.create_client("127.0.0.1", PORT)
    set_process_input(true)
    set_process(true)
    client.set("username", username)
    rpc_id(1, "add_message", username + " has joined the chat")

#to use the join method, you can call it on the chatroom instance with a desired username like so
#var chat_room = ChatRoom.new()
#chat_room.join("Bob")
