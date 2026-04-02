extends "res://scripts/magical_rat.gd"


const ROCKET = preload("res://scenes/rocket.tscn")




func _attack():
	var rocket = ROCKET.instantiate()
	rocket.target = global_transform.origin + (-global_transform.basis.z * 10)
	add_child(rocket)
	$resting.start()
	
