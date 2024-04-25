extends CharacterBody2D
var i = 0
var j = 0
# Get the gravity from the project settings to be synced with RigidBody nodes.

func _physics_process(delta):
	# Add the gravity.
	if i == 1:
		if Input.is_action_just_pressed("e"):
			j = 1
	if j == 1:
		scale.x = move_toward(scale.x,0,0.2)
		scale.y = move_toward(scale.y,0,0.2)
	if scale.x==0:
		queue_free()
	move_and_slide()


func _on_area_2d_body_entered(body):
	i= 1 # Replace with function body.
	$TextEdit.visible = true
