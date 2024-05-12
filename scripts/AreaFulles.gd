extends Area2D
var i = 0
var temps = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if i == 1:
		$"../Jugador principal".global_position.x = move_toward($"../Jugador principal".global_position.x,$"Forat".global_position.x,1)
		$"../Jugador principal".global_position.y = move_toward($"../Jugador principal".global_position.y,$"Forat".global_position.y,1)
		temps += 1
	if temps == 55:
		get_tree().change_scene_to_file("res://scenes/Laberint.tscn")
func _on_body_entered(body):
	if body == $"../Jugador principal":
		$crit.play()
		$"../Jugador principal"/AnimationPlayer.play("encongir")
		$fulles.visible =	false
		$"Forat".visible = true
		$"../Jugador principal"/Control/HBoxContainer.visible = false
		i = 1
		
	 
