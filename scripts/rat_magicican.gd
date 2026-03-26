extends "res://scripts/rat.gd"


func attack():
	get_tree().call_group("main","clouds_going_away")
	pass
