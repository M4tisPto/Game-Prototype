extends State
func get_state_name():
	return "FastFall"
func enter():
	player.velocity.y = player.GROUND_SLAM_SPEED
	player.velocity.x = 0

func physics_update(delta):
	if player.is_on_floor():
		var direction = Input.get_axis("move_left", "move_right")
		
		if direction == 0:
			state_machine.change_state($"../IdleState")
		else:
			state_machine.change_state($"../MoveRunState")
