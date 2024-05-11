extends CharacterBody2D
var ch_in = false
var opened = 0
var collectable = false
@onready var texto = $TextEdit
@onready var cofre_a := $"Animació cofre"
@onready var object = $"../AnimatedSprite2D"
func _physics_process(delta):
	abrir()
	if opened == 2 and Input.is_action_just_pressed("e"):
			$"../AnimatedSprite2D".visible = false
			texto.visible = false
func _on_area_2d_body_entered(body):
	ch_in = true 
	texto.visible = true
func _on_area_2d_body_exited(body):
	ch_in = false 
	texto.visible = false
	
func abrir():
	if ch_in:
		if Input.is_action_just_pressed("e") and opened == 0:
			texto.visible = false
			opened = 1
		if opened == 1:
			cofre_a.play("default")
			if cofre_a.frame ==2:
				cofre_a.play("stop")
				$Sprite2D.visible = true
				texto.visible = true
				texto.text = "press E to collect"
				$"../AnimationPlayer".play("grow")
				opened = 2

