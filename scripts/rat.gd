extends CharacterBody3D


@export var speed = 5.0
@export var hp = 100.0
@export var attack_power = 10
#a rank that is given to the player once this rat dies
@export var on_death_rank = 1.0
var frozen = false
var eating = false


func start_eating():
	eating = true

func freeze():
	frozen = true
	$Timer.start()
	var rr = PathFollow3D.new()
	

func take_damage(damage):
	hp -=damage
	if hp<= 0 :
		#rat is dead and should play death animation
		return 1
	else:
		get_tree().call_group("main","increase_rank",on_death_rank)
		return 0
	
		

func _physics_process(delta):
	
	if frozen:
		return
		


func _on_timer_timeout():
	frozen = false
