extends Node
func _on_button_pressed():
	Global.player_has_key = false
	Global.player_has_torch = false
	Global.player_stones = 4
	Global.player_health = 5
	get_tree().change_scene_to_file("res://scenes/introducció.tscn")

