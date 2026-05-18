extends Area2D


func _input(event: InputEvent):
	if event.is_action_pressed("enter_door"):
		print(get_overlapping_areas().size())
