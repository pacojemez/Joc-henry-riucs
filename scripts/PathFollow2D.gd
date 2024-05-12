extends PathFollow2D
var go = true
var speed = 0.1
func _process(delta):
	if go:
		progress_ratio += delta* speed
	
