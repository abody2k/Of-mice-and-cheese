extends StaticBody3D


var seeds_in = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_queue_timeout():
	if seeds_in > 0:
		seeds_in -=1
		get_tree().call_group("main","increase_flour")
		$queue.start()
