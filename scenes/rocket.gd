extends CharacterBody3D


@export var TIME = 0.5
@export var HEIGHT = 3.0
var target : Vector3 = Vector3(-1,-1,-1)

func compute_xz():


	velocity.y = sqrt(2 * 9.8 * HEIGHT)
	var t_up = velocity.y/9.8
	var t_down = sqrt(2.0 * (HEIGHT - (target.y-global_position.y))/9.8)
	TIME = t_up + t_down
	
	velocity.x =(target.x - global_position.x)/TIME
	velocity.z =(target.z - global_position.z)/TIME
	#((target.y - global_position.y) + (1.0/2.0 * (-9.8) * pow(TIME,2)))/ TIME


func _ready():
	
	compute_xz()
	
	
func _process(delta):
	velocity.y -= delta * 9.8
	look_at(global_position+ velocity)
	move_and_collide(velocity * delta)
