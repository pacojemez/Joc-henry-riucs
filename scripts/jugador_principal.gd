extends CharacterBody2D
@export var pedra : PackedScene
@onready var animacio = $"Animació jugador principal"
var has_torch = false
const SPEED = 100.0
const JUMP_VELOCITY = -100.0
var vida = 4



func _physics_process(delta):
	movement(delta)
	if Input.is_action_just_pressed("attack"):
		shoot_pedra()
	animations()

func movement(delta):
	
	if Input.is_action_pressed("pujar"):
		velocity.y = - SPEED
	elif Input.is_action_pressed("baixar"):
		velocity.y = SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	velocity.normalized()
	move_and_slide()

func shoot_pedra():
	var mouse_pos = get_global_mouse_position()
	var pedra = pedra.instantiate()
	add_sibling(pedra)
	$"."/pivot.look_at(mouse_pos)
	pedra.set_global_position($"."/pivot/throwing.global_position)
	pedra.velocity =  ($pivot/throwing.global_position- $pivot.global_position)*10
func animations():
	if vida > 0:
		if velocity.x > 0:
			animacio.play("run_side")
			animacio.flip_h = false
		if velocity.x < 0:
			animacio.play("run_side")
			animacio.flip_h = true
		if velocity.x == 0 and velocity.y == 0:
			animacio.play("idle_side")
		if velocity.y < 0 and velocity.x == 0:
			animacio.play("run_up")
			$CharacterBody2D.visible = true
		else:
			$CharacterBody2D.visible = false
		if velocity.y > 0 and velocity.x == 0:
			animacio.play("run_down")
		if velocity.y > 0 and velocity.x < 0:
			animacio.play("run_side")
			animacio.flip_h = true
		if velocity.y > 0 and velocity.x > 0:
			animacio.play("run_side")
			animacio.flip_h = false
		if velocity.y < 0 and velocity.x > 0:
			animacio.play("run_side")
			animacio.flip_h = false
		if velocity.y < 0 and velocity.x < 0:
			animacio.play("run_side")
			animacio.flip_h = true
	if has_torch == true:
		$CharacterBody2D.visible = true
	if vida == 0:
		animacio.play("die")
		if animacio.frame == 3:
			get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	if vida == 4:
		pass
	if vida == 3: 
		$Camera2D/Node2D/Heart4.visible = false
	if vida == 2: 
		$Camera2D/Node2D/Heart4.visible = false
		$Camera2D/Node2D/Heart3.visible = false
	if vida == 1: 
		$Camera2D/Node2D/Heart4.visible = false
		$Camera2D/Node2D/Heart3.visible = false
		$Camera2D/Node2D/Heart2.visible = false
	if vida == 0: 
		$Camera2D/Node2D/Heart4.visible = false
		$Camera2D/Node2D/Heart3.visible = false
		$Camera2D/Node2D/Heart2.visible = false
		$Camera2D/Node2D/Heart.visible = false
