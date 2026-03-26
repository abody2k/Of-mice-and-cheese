extends Node3D

var gold = 0
var water = 0.0
var flour = 0
var seeds = 0
var electricity = 0
var water_capacity = 0.0
var electricity_capacity = 0

var open_water_gate = false

var raining = false
var rain_multiplier = 1.0



enum STUFF{
	
	SEEDS=10,FLOUR= 20, ELECTRICITY=100,WATER=100
}




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if open_water_gate:
		decrease_water(delta)
		
	if raining:
		increase_water(delta)
	
	
	
func decrease_water(by_how_much):
	if water < by_how_much:
		return -1
	else:
		water -= by_how_much
		water = clampf(water,0,water_capacity)
		return 0
		
func increase_water(new_water):
	water+= rain_multiplier * new_water
	water = clampf(water,0,water_capacity)



func buy_something(price):
	if gold < price:
		return -1
	else:
		gold -= price
		return 0
		
func sell_something(something):
	pass
