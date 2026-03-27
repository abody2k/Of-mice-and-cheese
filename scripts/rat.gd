extends CharacterBody3D


@export var speed = 5.0
@export var hp = 100.0
@export var attack_power = 10
#a rank that is given to the player once this rat dies
@export var on_death_rank = 1.0
var frozen = false


func take_damage(damage):
	hp -=damage
	if hp<= 0 :
		#rat is dead and should play death animation
		return 1
	else:
		get_tree().call_group("main","increase_rank",on_death_rank)
		return 0
	
		

func _physics_process(delta):
	pass
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#if direction:
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)
#
	#move_and_slide()
