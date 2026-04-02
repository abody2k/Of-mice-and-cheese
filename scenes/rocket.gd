extends CharacterBody3D


@export var TIME = 0.5

var target : Vector3 = Vector3(-1,-1,-1)

func compute_xz():
	target = position + Vector3(100,100,100)
	velocity.x =(target.x - global_position.x)/TIME
	velocity.z =(target.z - global_position.z)/TIME
	velocity.y = ((target.y - global_position.y) + (1.0/2.0 * (-9.8) * pow(TIME,2)))/ TIME


func _ready():
	
	compute_xz()
	
	
func _process(delta):
	velocity.y+= delta * -9.8
	move_and_collide(velocity)
