extends CharacterBody2D
var is_dead = false

	
func _physics_process(delta):
	move_and_slide()
	dead()
	
func _on_area_2d_body_entered(body):
	if body == $".."/"Jugador principal":
		$".."/"Jugador principal".vida += -1

func dead():
	if is_dead == true:
		if $"Animació slime".animation == "destroy" and $"Animació slime".frame == 5:
			$"../Slime".queue_free()
	else:
		$"Animació slime".play("idleandjump")
