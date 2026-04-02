extends "res://scripts/magical_rat.gd"


const ROCKET = preload("res://scenes/rocket.tscn")
func _on_reload_timeout():
	
	_attack()



func _attack():
	var rocket = ROCKET.instantiate()
	rocket.target = global_position+ basis.z * 10
	add_child(rocket)
