extends CharacterBody2D
var i = 0
var j = 0
@onready var cofre_a := $"Animació cofre"
# Get the gravity from the project settings to be synced with RigidBody nodes.

func _physics_process(delta):
	# Add the gravity.
	if i == 1:
		if Input.is_action_just_pressed("e"):
			j = 1
	if j == 1:
		cofre_a.play("default")
		if cofre_a.frame ==2:
			$Sprite2D.visible = true
	if $Sprite2D.visible == true:
		cofre_a.play("stop")
func _on_area_2d_body_entered(body):
	i= 1 # Replace with function body.
	
	$TextEdit.visible = true
func _on_area_2d_body_exited(body):
	i= 0 # Replace with function body.
	$TextEdit.visible = false # Replace with function body.
