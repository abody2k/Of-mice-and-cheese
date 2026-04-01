extends CharacterBody3D


@export var speed = 5.0
@export var hp = 100.0
@export var attack_power = 10
#a rank that is given to the player once this rat dies
@export var on_death_rank = 1.0
var frozen = false

var tween : Tween



func cheese_is_gone():
	tween_finished()
	
	
	
func freeze():
	frozen = true
	$Timer.start()
	tween.pause()
	

enum MODES {GOING_TOWARDS_CHEESE,EATING,RETURNING}

var mode = MODES.GOING_TOWARDS_CHEESE


func tween_finished():
	match mode :
		MODES.GOING_TOWARDS_CHEESE:
			mode = MODES.EATING
		MODES.EATING:
			mode = MODES.RETURNING
		MODES.RETURNING:
			queue_free()
			
	
func take_damage(damage):
	hp -=damage
	if hp<= 0 :
		#rat is dead and should play death animation
		return 1
	else:
		get_tree().call_group("main","increase_rank",on_death_rank)
		return 0
	
		


func _ready():
	
	tween = create_tween()
	tween.finished.connect(tween_finished)
	tween.tween_property(get_parent(),"progress_ratio",1.0,10)
	


func _process(delta):
	if mode == MODES.EATING:
		get_tree().call_group("main","eating",int(get_parent().get_parent().name),delta,self)


func _on_timer_timeout():
	tween.play()
	
