extends Node2D

func _on_btn_math_button_down() -> void:
	get_tree().change_scene_to_file("res://Math/main.tscn")

func _on_btn_reading_button_down() -> void:
	get_tree().change_scene_to_file("res://Reading/sentance select.tscn")
