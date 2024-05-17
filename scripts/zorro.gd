extends CharacterBody2D
@onready var path = $".."
@onready var animacio_zorro = $AnimatedSprite2D
@onready var pivot_atk = $"../../../zona ataque"
@onready var pivot_ataque = $"../../../zona ataque/ataque"
@onready var animation = $"../../../zona ataque/ataque/AnimationPlayer"
@onready var pivot_area = $"../../../zona ataque/Node2D"
var position_actual : Vector2
var position_antiga : Vector2
var velocitat : Vector2
const v_max = 0.01
var cooldown = 3
var attack_time = 1
var charging = true
var character_in = false
var position_character
var calc_pos = false
var able_to_attack = true
var walking = true
var ataque = false
var ch_in = false
var vida = 10
var temps_critical = 10
var temps_d_ataque = 3
func _physics_process(delta):
	$AnimatedSprite2D2.frame = vida
	$"..".go = false
	calc_velocitat()
	if $Critical.visible == true:
		temps_critical -= delta
		if temps_critical <= 0:
			$Critical.visible = false
			temps_critical = 100
	var prev_pos = pivot_ataque.global_position
	if not charging and vida > 0:
		animations()
		cooldown -= delta
		path.go = true
	if cooldown < 0:
		able_to_attack = true
	if able_to_attack and vida > 0:
		pivot_ataque.visible = false
		prev_pos = global_position
		atacar(delta)
	pivot_atk.global_position = prev_pos
	if vida <= 0:
		animations_dead()
		
	move_and_collide(Vector2(0,0))
func calc_velocitat():
	if not position_actual == global_position:
		position_antiga = position_actual
	position_actual = global_position
	velocitat = position_actual - position_antiga
func animations():
	if velocitat.x > 10:
		animacio_zorro.play("walk")
		animacio_zorro.flip_h = false
	if velocitat.x < -10:
			animacio_zorro.play("walk")
			animacio_zorro.flip_h = true
	if velocitat.x == 0 and velocitat.y == 0:
			animacio_zorro.play("idle")
	if velocitat.y < 0 and abs(velocitat.x) < v_max:
		animacio_zorro.play("walk_up")
	if velocitat.y > 0 and abs(velocitat.x) < v_max:
		animacio_zorro.play("run_down")
	if velocitat.y > 0 and velocitat.x < -v_max:
		animacio_zorro.play("walk")
		animacio_zorro.flip_h = true
	if velocitat.y > 0 and velocitat.x > v_max:
			animacio_zorro.play("walk")
			animacio_zorro.flip_h = false
	if velocitat.y < 0 and velocitat.x > v_max:
		animacio_zorro.play("walk")
		animacio_zorro.flip_h = false
	if velocitat.y < 0 and velocitat.x < -v_max:
		animacio_zorro.play("walk")
		animacio_zorro.flip_h = true
func animations_dead():
	if not animacio_zorro.animation == "dead":
		$AnimatedSprite2D2.visible = false
		$Critical.visible = false
		animacio_zorro.animation = "oh_dios"
	if animacio_zorro.frame == 3:
		animacio_zorro.animation = "dead"
		Global.zorro_dead = true
func atacar(delta):
	if character_in and able_to_attack:
		charging = true
	if attack_time < 0 and able_to_attack:
		pivot_area.visible = false
		pivot_ataque.visible = true
		animation.play("aparecer ataque")
		charging = false
		attack_time = 1
		if $"../../../zona ataque/ataque/6".scale.y >0.09:
			if character_in:
				if Global.player_stones == 0:
					Global.player_health -= 10
				Global.player_health -= 2
			animation.pause()
			cooldown = 3
			able_to_attack = false
	if charging and able_to_attack:
		if attack_time > 0.5:
			position_character = $"../../../Jugador principal".global_position
			pivot_area.visible = true
			pivot_atk.look_at(position_character)
		attack_time-=delta
		path.go = false
		animacio_zorro.play("cargando_ataque")
		
func _body_entered(body):
	if body == $"../../../Jugador principal":
		character_in = true

func _body_exited(body):
	if body == $"../../../Jugador principal":
		character_in = false
