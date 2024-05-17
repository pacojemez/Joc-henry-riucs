extends CollisionShape2D
var timer = 2
func _physics_process(delta):
	if Global.zorro_dead == true:
		timer -= delta
		if timer <= 0:
			if not $"../sonidoporta".playing:
				$"../sonidoporta".play()
			$"../LightOccluder2D".queue_free()
			$"../AnimatedSprite2D".play("porta obrint")
			if $"../AnimatedSprite2D".frame == 5:
				
				queue_free()
