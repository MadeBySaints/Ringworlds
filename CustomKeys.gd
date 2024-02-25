extends Node

const MAPPINGS_FILE = "res://key_mappings.cfg"
var new_input = InputEventKey.new()
var key_mappings = {
    "move_up": KEY_W,
    "move_down": KEY_S,
    "move_left": KEY_A,
    "move_right": KEY_D,
    "jump": KEY_SPACE
}

func _ready():
    # Load the key mappings from file
    if File.exists(MAPPINGS_FILE):
        key_mappings = load(MAPPINGS_FILE)
    
    # Register the key mappings with the InputMap
    for key_name in key_mappings.keys():
        InputMap.add_action(key_name)
        InputMap.action_add_event(key_name, InputEventKey(key_mappings[key_name], true))

func _input(event):
    if event.is_action_pressed("ui_cancel"):
        # Open the key remapping menu
        var key_remapping = KeyRemapping.new(key_mappings)
        get_tree().get_root().add_child(key_remapping)
        key_remapping.popup_centered()

func save_mappings():
    # Save the key mappings to file
    var file = File.new()
    file.open(MAPPINGS_FILE, File.WRITE)
    file.store_var(key_mappings)
    file.close()

func remap_key(key_name, key_code):
    # Update the key mapping and InputMap
    if key_name in key_mappings.keys():
        key_mappings[key_name] = key_code
        InputMap.action_erase_events(key_name)
        InputMap.action_add_event(key_name, InputEventKey(key_code, true))

func get_key_code(key_name):
    # Get the current key code for a given key mapping
    if key_name in key_mappings.keys():
        return key_mappings[key_name]
    else:
        return null

func _notification(_what):
    if _what == NOTIFICATION_WM_QUIT_REQUEST:
        # Save the key mappings when the game is closed
        save_mappings()
