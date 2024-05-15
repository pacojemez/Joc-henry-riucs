extends CharacterBody2D
var is_dead = false

	
func _physics_process(delta):
	
	move_and_slide()
	dead()
	mirar()
func _on_area_2d_body_entered(body):
	if body == $"../../Jugador principal":
		$"../../Jugador principal".got_hit = true
		Global.player_health += -1
func mirar():
	if global_position.x > $"../../Jugador principal".global_position.x:
		$"Animació slime".flip_h = true
	else:
		$"Animació slime".flip_h = false
func dead():
	if is_dead == true:
		if $"Animació slime".animation == "destroy" and $"Animació slime".frame == 5:
			queue_free()
	else:
		$"Animació slime".play("idleandjump")
