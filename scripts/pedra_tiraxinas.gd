extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.


func _physics_process(delta):
	velocity.x = SPEED
	move_and_slide()
	if velocity.x == 0:
		visible = false
