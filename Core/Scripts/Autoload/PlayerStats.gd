extends Node

var base_health
var current_health
var base_energy
var current_energy

var level
var total_time
var enemies_slain

var ability_score = [
	"Power",#attack, base health
	"Intellegence",#exp rate, crit rate
	"Endurance",#defense, base energy
	"Luck"#drop rate, crit rate
	]
	
var modifier = [
	"Attack",
	"Defense",
	"Move Speed",
	"Critical Rate",
	"Drop Rate",
	"EXP Rate",
	"Level"
	]

var point = [
	"HP",
	"AP"
	]

var tracker = {
	"Time Played" : total_time,
	"Enemies Slain" : enemies_slain
	}

var save_data = {}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func remove_health(amount):
	pass
	
func add_health(amount):
	pass
	
func remove_mana(amount):
	pass
	
func add_mana(amount):
	pass
	
func remove_exp(amount):
	pass
	
func add_exp(amount):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
