extends State
class_name WalkState

func enter():
	print("Walk")

func physics_update(delta):
	var direction = Input.get_axis("move_left", "move_right")

	if direction == 0:
		state_machine.change_state("idlestate")
		return

	player.velocity.x = direction * player.walk_speed

func handle_input(event):
	if Input.is_action_just_pressed("jump"):
		state_machine.change_state("jumpstate")
