extends Area2D
var ch_in
var timer = .85
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ch_in:
		$"../Jugador principal".script = ""
		$"../ColorRect".position.x += 300*delta
		$"../ColorRect2".position.x -= 300*delta
		timer -= delta
	if timer <= 0:
		get_tree().change_scene_to_file("res://scenes/PANTALLA FINAL.tscn")

func _on_body_entered(body):
	if body == $"../Jugador principal":
		ch_in = true# Replace with function body.
