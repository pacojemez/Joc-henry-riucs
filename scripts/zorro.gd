extends CharacterBody2D
@onready var path = $".."
@onready var animacio_zorro = $AnimatedSprite2D
@onready var pivot_ataque = $ataque
var position_actual : Vector2
var position_antiga : Vector2
var velocitat : Vector2
const v_max = 0.01
var cooldown = 3
var attack_time = 2
var charging = false
var character_in = false
var position_character
var calc_pos = false
var attack_done = true
var able_to_attack
func _physics_process(delta):
	$Label.text = "atk_dn" + str(attack_done)+"\n"+"col" + str(cooldown)
	calc_velocitat()
	if not charging:
		animations()
	if attack_done:
		able_to_attack = false
		cooldown -= delta
	if cooldown < 0:
		able_to_attack = true
		attack_done = false
		pivot_ataque.visible = false
		cooldown = 3
	if able_to_attack:
		atacar(delta)
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
		
func atacar(delta):
	if character_in:
		charging = true
	if attack_time < 0:
		pivot_ataque.visible = true
		pivot_ataque.look_at(position_character)
		$ataque/AnimationPlayer.play("aparecer ataque")
		charging = false
		if $ataque/"6".scale.y >0.09:
			$ataque/AnimationPlayer.pause()
			attack_done = true
	if charging:
		if calc_pos == true:
			position_character = $"../../../Jugador principal".global_position
		attack_done = false
		attack_time-=delta
		path.go = false
		animacio_zorro.play("cargando_ataque")
		
func _body_entered(body):
	if body == $"../../../Jugador principal":
		character_in = true
		calc_pos = true

func _body_exited(body):
	if body == $"../../../Jugador principal":
		character_in = false
		calc_pos = false
