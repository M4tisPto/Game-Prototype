extends Control
#mati u bum u didnt add anything to start the game

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game.tscn")

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/options.tscn")
