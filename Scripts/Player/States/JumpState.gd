extends State
func get_state_name():
	return "Jump"
func enter():
	player.velocity.y = player.jump_force

func physics_update(delta):
	var direction = Input.get_axis("move_left", "move_right")
	player.velocity.x = direction * player.speed
	
	if player.is_on_floor():
		if direction == 0:
			state_machine.change_state($"../IdleState")
		else:
			state_machine.change_state($"../MoveRunState")
