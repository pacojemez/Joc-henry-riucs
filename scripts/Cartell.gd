extends Area2D
var ch_in = false
@onready var texto = $TextEdit
# Called when the node enters the scene tree for the first time.
func _ready():
	texto.visible = false # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body == $"../Jugador principal":
		ch_in = true 
		texto.visible = true


func _on_body_exited(body):
	if body == $"../Jugador principal":
		ch_in = true 
		texto.visible = false
