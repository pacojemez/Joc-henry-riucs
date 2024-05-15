extends Area2D
var has_arrived = 0
var j = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body == $"../../Jugador principal":
		$Label.visible = true 
		has_arrived = 1


func _on_body_exited(body):
	if body == $"../../Jugador principal":
		has_arrived = 0
		$Label.visible = false
func _physics_process(delta):
	if has_arrived == 1:
		if Input.is_action_just_pressed("e"):
			j = 1
	if j == 1:
		$"../AnimatedSprite2D".play("porta obrint")
		$"../AnimatedSprite2D2".play("porta obrint")
		$"../CollisionShape2D".queue_free()
		$"../CollisionShape2D2".queue_free()
		$".".queue_free()
