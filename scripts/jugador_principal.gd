extends CharacterBody2D
@export var pedra : PackedScene
@onready var animacio = $"Animació jugador principal"
const SPEED = 100.0
const JUMP_VELOCITY = -100.0

# Get the gravity from the project settings to be synced with RigidBody nodes.


func _physics_process(delta):
	
	movement(delta)
	if Input.is_action_just_pressed("attack"):
		shoot_pedra()
		$TextEdit.text = str(position)
	animations()
func movement(delta):
		# Handle jump.
	if Input.is_action_pressed("pujar"):
		velocity.y = - SPEED
	elif Input.is_action_pressed("baixar"):
		velocity.y = SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func shoot_pedra():
	var mouse_pos = get_global_mouse_position()
	var pedra = pedra.instantiate()
	add_sibling(pedra)
	pedra.set_global_position($throwing.global_position)
	
func animations():
	if velocity.x > 0:
		animacio.play("run_side")
		animacio.flip_h = false
		
	if velocity.x < 0:
		animacio.play("run_side")
		animacio.flip_h = true
	if velocity.x == 0:
		animacio.play("idle_side")
	if velocity.y < 0:
		animacio.play("run_up")
	if velocity.y > 0:
		animacio.play("run_down")
	if velocity.y > 0 and velocity.x < 0:
		animacio.play("run_side")
		animacio.flip_h = true
	if velocity.y > 0 and velocity.x > 0:
		animacio.play("run_side")
		animacio.flip_h = false
	if velocity.y < 0 and velocity.x > 0:
		animacio.play("run_side")
		animacio.flip_h = false
	if velocity.y < 0 and velocity.x < 0:
		animacio.play("run_side")
		animacio.flip_h = true
	pass
