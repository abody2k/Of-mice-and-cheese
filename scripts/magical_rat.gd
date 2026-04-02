extends "res://scripts/rat.gd"


func _ready():
	
	tween = create_tween()
	tween.finished.connect(tween_finished)
	tween.tween_property(get_parent(),"progress_ratio",0.2 + randf_range(0.1,0.5),10)
	

func tween_finished():
	match mode :
		MODES.GOING_TOWARDS_CHEESE:
			mode = MODES.ATTACKING
			$resting.start()
			
			

func _process(_delta):
		pass


func _attack():
	#perform attacking
	#after the attack start the resting timer
	get_tree().call_group("main","clouds_going_away")
