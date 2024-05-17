extends Node
func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/introducció.tscn")


func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://scenes/objectius.tscn")


func _on_button_2_pressed():
	get_tree().quit()
