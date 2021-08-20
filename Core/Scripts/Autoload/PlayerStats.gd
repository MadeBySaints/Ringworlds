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
	"Power",
	"Intellegence",
	"Luck"
	]
	
var modifier = [
	"Attack",
	"Defense",
	"Speed",
	"Critical Rate",
	"Drop Rate",
	"EXP Rate",
	"Level"
	]
var atkFormula = modifier.Attack
var defFormula = modifier.Defense
var damageCalc = atkFormula - defFormula

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

func remove_health(amount, damage_reduction):
	pass
	
func add_health(amount, mod):
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
