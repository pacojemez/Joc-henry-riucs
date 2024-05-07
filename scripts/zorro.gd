extends CharacterBody2D

@onready var animacio_zorro = $AnimatedSprite2D

func _physics_process(delta):

	velocity.y =-100
	if velocity.x > 0:
			animacio_zorro.play("walk")
			animacio_zorro.flip_h = false
	if velocity.x < 0:
			animacio_zorro.play("walk")
			animacio_zorro.flip_h = true
	if velocity.x == 0 and velocity.y == 0:
			animacio_zorro.play("idle")
	if velocity.y < 0 and velocity.x == 0:
		animacio_zorro.play("walk_up")
	#if velocity.y > 0 and velocity.x == 0:
		#animacio_zorro.play("run_down")
	if velocity.y > 0 and velocity.x < 0:
		animacio_zorro.play("walk")
		animacio_zorro.flip_h = true
	if velocity.y > 0 and velocity.x > 0:
			animacio_zorro.play("walk")
			animacio_zorro.flip_h = false
	if velocity.y < 0 and velocity.x > 0:
		animacio_zorro.play("walk")
		animacio_zorro.flip_h = false
	if velocity.y < 0 and velocity.x < 0:
		animacio_zorro.play("walk")
		animacio_zorro.flip_h = true
	move_and_slide()
