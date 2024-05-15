extends CharacterBody2D
@export var pedra : PackedScene
@onready var animacio = $"Animació jugador principal"
@onready var anim = $Control/HBoxContainer/AnimatedSprite2D
const SPEED = 100.0
const JUMP_VELOCITY = -100.0
var cooldown = 0
var got_hit = false
var object = Object
var movimiento_naranja = false
func _physics_process(delta):
	if movimiento_naranja:
		if not $passos.playing:
			$passos.play()
	if Input.is_action_just_pressed("i"):
		$Control/HBoxContainer.visible = true
	if object == $"../cofre_key":
		Global.player_has_key = true
	if object == $"../cofre_torch":
		Global.player_has_torch = true
	movement(delta)
	if cooldown > 0:
		cooldown -= delta
	if Input.is_action_just_pressed("attack"):
		shoot_pedra()
	animations()
	if Global.player_stones == 0:
		$Control/Label.visible = true
	else:
		$Control/Label.visible = false
	$Control/HBoxContainer/Sprite2D/Label.text = str(Global.player_stones)
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
	if velocity != Vector2(0,0):
			movimiento_naranja = true
	else:
		movimiento_naranja = false
		$passos.stop()
	velocity.normalized()
	move_and_slide()
func shoot_pedra():
	var mouse_pos = get_global_mouse_position()
	var pedra = pedra.instantiate()
	if cooldown <= 0 and Global.player_stones > 0:
		add_sibling(pedra)
		$"."/pivot.look_at(mouse_pos)
		pedra.set_global_position($"."/pivot/throwing.global_position)
		pedra.velocity =  ($pivot/throwing.global_position- $pivot.global_position)*100
		pedra.stopped = false
		cooldown = 1
		Global.player_stones -= 1
func animations():
	if Global.player_has_torch:
		$PointLight2D.texture_scale = 10
	if Global.player_health > 0:
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
			if Global.player_has_torch:
				$CharacterBody2D.visible = true
		else:
			if Global.player_has_torch:
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
	if got_hit:
		$AnimationPlayer2.play("hit")
		got_hit = false
	
	if Global.player_health == 0:
		anim.frame = 0
		animacio.play("die")
		if animacio.frame == 3:
			get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	else:
		anim.frame = Global.player_health
