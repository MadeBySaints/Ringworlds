extends Node

var base_health
var current_health
var base_mana
var current_mana
var base_energy
var current_energy

var job
var level
var total_time
var enemies_slain

var ability_score = [
	"Strength",
	"Dexterity",
	"Intellect",
	"Luck"
	]
	
var modifier = [
	"Attack",
	"Defense",
	"Speed",
	"Critical Rate",
	"Drop Rate",
	"EXP Rate"
	]

var point = [
	"HP",
	"MP",
	"SP",
	"AP"
	] 
	#hp/mp, skill point, ability point

var tracker = {
	"Time Played" : total_time,
	"Enemies Slain" : enemies_slain
	}

var save_data = {}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
