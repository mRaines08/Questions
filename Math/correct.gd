extends Node2D
	
func _on_btn_again_correct_button_down() -> void:
	get_tree().change_scene_to_file("res://Math/main.tscn")
