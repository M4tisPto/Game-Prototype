extends State
class_name IdleState

func enter():
	print("Idle")

func physics_update(delta):
	var direction = Input.get_axis("move_left", "move_right")

	if direction != 0:
		state_machine.change_state("walkstate")

func handle_input(event):
	if Input.is_action_just_pressed("jump"):
		state_machine.change_state("jumpstate")
