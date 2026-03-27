extends Node3D

var gold = 0.0
var water = 0.0
var flour = 0
var seeds = 0
var electricity = 0
var water_capacity = 0.0
var electricity_capacity = 0
var special_rank = 0.0
var open_water_gate = false

var raining = false
var rain_multiplier = 1.0

var cloudy= true


const STUFF = {
"SEEDS":0.5,
"FLOUR": 10,
 "ELECTRICITY":100,
"WATER":100
}


const SPECIAL_POWERS = {
	
	"AIR_STRIKES": 10.0,
	"MONEY_DROP": 20.0,
}



func clouds_going_away():
	get_tree().call_group("plants","grow_normally")
	cloudy = false
	raining = false
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if open_water_gate:
		decrease_water(delta)
		
	if raining and cloudy:
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



func buy_something(item):
	var price = STUFF[item]
	
	if gold < price:
		return -1
	else:
		gold -= price
		match item:
			"SEEDS":
				seeds+=1
			"ELECTRICITY":
				electricity_capacity+=1
			"WATER":
				water_capacity+=1
			"FLOUR":
				flour+=1
		return 0
		
func sell_something(something):
	pass


func _on_rain_timeout():
	$rain.wait_time = randf_range(2,30)
	raining = true
	$raining.start()
	
func increase_flour():
	flour+=1	


func _on_raining_timeout():
	raining = false
	$rain.start()
	
	
func increase_rank(rank_increase):
	special_rank+=rank_increase
	
	
