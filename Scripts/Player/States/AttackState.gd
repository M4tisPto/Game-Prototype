extends State

func get_state_name():
	return "Attack"
@onready var timer: Timer = $Timer


func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("attack_button")):
		timer.start()
