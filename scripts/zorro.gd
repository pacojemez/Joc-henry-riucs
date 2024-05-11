extends CharacterBody2D

@onready var animacio_zorro = $AnimatedSprite2D
var position_actual : Vector2
var position_antiga : Vector2
var velocitat : Vector2

func _physics_process(delta):
	if not position_actual == global_position:
		position_antiga = position_actual
	position_actual = global_position
	velocitat = position_actual - position_antiga
	if velocitat.x > 0:
			animacio_zorro.play("walk")
			animacio_zorro.flip_h = false
	if velocitat.x < 0:
			animacio_zorro.play("walk")
			animacio_zorro.flip_h = true
	if velocitat.x == 0 and velocitat.y == 0:
			animacio_zorro.play("idle")
	if velocitat.y < 0 and abs(velocitat.x) < 10:
		animacio_zorro.play("walk_up")
	if velocity.y > 0 and abs(velocitat.x) < 10:
		animacio_zorro.play("run_down")
	if velocitat.y > 0 and velocitat.x < 10:
		animacio_zorro.play("walk")
		animacio_zorro.flip_h = true
	if velocitat.y > 0 and velocitat.x > 10:
			animacio_zorro.play("walk")
			animacio_zorro.flip_h = false
	if velocitat.y < 0 and velocitat.x > 10:
		animacio_zorro.play("walk")
		animacio_zorro.flip_h = false
	if velocitat.y < 0 and velocitat.x < 10:
		animacio_zorro.play("walk")
		animacio_zorro.flip_h = true
func abs(num):
	if num >= 0:
		return num
	if num < 0:
		return -num
