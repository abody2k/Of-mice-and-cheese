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
var defenses_on = false
var raining = false
var rain_multiplier = 1.0
var bullets = 0
var cloudy= true

@export var waves_left = 10

const RAT = preload("res://scenes/rat.tscn")


const STUFF = {
"SEEDS":0.5,
"FLOUR": 10,
 "ELECTRICITY":100,
"WATER":100,
"BULLETS":0.1
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
	$waves.start()


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
	
	


func spend_rank(special_power):
	if special_rank >= SPECIAL_POWERS[special_power]:
		special_rank -= SPECIAL_POWERS[special_power]
		if special_power == "MONEY_DROP":
			gold += randi_range(100,200)
		return 0
	else:
		return 1
	

func use_electricity(required_capacity):
	if electricity + required_capacity > electricity_capacity:
		return 1
	else:
		electricity+= required_capacity
		return 0
		
func electricity_release(released_energy):
	electricity-=released_energy
		


func player_entered(pressure_point_type):
	
	if pressure_point_type == 0:
		defenses_on = true
		open_water_gate = false
	else:
		defenses_on = false
		open_water_gate = true
		
func player_left(pressure_point_type):
	if pressure_point_type == 0:
		defenses_on = false
	else:
		open_water_gate = false	


func _on_waves_timeout():
	$waves/spawning.start()


func _on_spawning_timeout():
	waves_left -=1
	#spawn a new rat
	
	match  randi_range(0,2):
		0:
			var rat = RAT.instantiate()
			get_node("paths/"+str(randi_range(0,3))+"/follow").add_child(rat)
			
		1:
			pass
		2:
			pass
	if waves_left ==0:
		waves_left = randi_range(10,30)
		$waves/spawning.stop()
		$waves.start()
	





func _on_buy_bullets_button_down():
	if gold > 0:
		gold-=1
		bullets+=10


func _on_buy_flour_button_down():
	if gold >= 10:
		gold-=10
		flour+=1





func _on_buy_seeds_button_down():
	if gold >= 0.5:
		gold-=0.5
		seeds+=1


func _on_buy_electricity_capacity_button_down():
	if gold > 100:
		gold-=100
		electricity_capacity+=1
	


func _on_button_button_down():
	if gold > 100:
		gold-=100
		water_capacity+=1
