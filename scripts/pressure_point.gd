extends Area3D


enum PRESSURE_POINT_TYPE {DEFENSE, WATER_GATE}

@export var pressure_point_type : PRESSURE_POINT_TYPE

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	get_tree().call_group("main","player_entered",pressure_point_type)


func _on_body_exited(body):
	pass # Replace with function body.
