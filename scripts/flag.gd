extends Area2D

@onready var game_manager = %GameManager


func _on_body_entered(_body):
	get_tree().change_scene_to_file("res://scenes/Level2.tscn")
