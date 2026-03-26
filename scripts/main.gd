extends Node3D

var gold = 0
var water = 0
var flour = 0
var seeds = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
	
func decrease_water(by_how_much):
	if water < by_how_much:
		return -1
	else:
		water -= by_how_much
		return 0
