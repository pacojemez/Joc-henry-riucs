extends Area2D
var i = 0
var temps = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if i == 1:
		$"../Jugador principal".global_position = $"Forat".global_position
		temps += 1
	if temps == 55:
		get_tree().change_scene_to_file("res://scenes/Laberint.tscn")
func _on_body_entered(body):
	if body == $"../Jugador principal":
		$"../Jugador principal"/AnimationPlayer.play("encongir")
		$fulles.visible =	false
		$"Forat".visible = true
		$"../Jugador principal"/Camera2D/Node2D.visible = false
		i = 1
		
	 
