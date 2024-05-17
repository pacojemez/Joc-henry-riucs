extends Area2D
var has_arrived = 0
var j = 0
var timer = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body == $"../../Jugador principal":
		has_arrived = 1


func _on_body_exited(body):
	if body == $"../../Jugador principal" and Global.player_has_key:
		has_arrived = 0
		$Label.text = ""
func _physics_process(delta):
	if has_arrived == 1:
		$Label.text = "E per obrir"
		if Input.is_action_just_pressed("e"):
			if not $"../ficarclau".playing:
				$"../ficarclau".play()
				j = 1
	if j == 1:
		timer -= delta
		if timer <= 0:
			if not $"../sonidoporta".playing:
				$"../sonidoporta".play()
			$"../AnimatedSprite2D".play("porta obrint")
			if $"../AnimatedSprite2D".frame == 5:
				$"../CollisionShape2D".queue_free()
				$".".queue_free()
