extends State

func enter():
	player.velocity.y = player.GROUND_SLAM_SPEED
	player.velocity.x = 0

func physics_update(delta):
	if player.is_on_floor():
		player.camera_2d.screen_shake(10.0, 0.2)
		
		var direction = Input.get_axis("move_left", "move_right")
		
		if direction == 0:
			state_machine.change_state($"../IdleState")
		else:
			state_machine.change_state($"../RunState")
