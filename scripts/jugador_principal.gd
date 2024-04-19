extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -100.0

# Get the gravity from the project settings to be synced with RigidBody nodes.


func _physics_process(delta):
	# Handle jump.
	if Input.is_action_pressed("pujar"):
		velocity.y = - SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	if Input.is_action_pressed("baixar"):
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
