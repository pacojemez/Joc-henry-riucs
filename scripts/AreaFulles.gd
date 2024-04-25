extends Area2D
var i = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if i == 1:
		$"../Jugador principal".global_position = $"../Forat".global_position


func _on_body_entered(body):
	if body == $"../Jugador principal":
		$"../Jugador principal"/AnimationPlayer.play("encongir")
		$"../fulles".visible =	false
		$"../Forat".visible = true
		i = 1
	 
