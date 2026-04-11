extends State

func enter():
	if player.is_on_floor():
		player.velocity.y = player.jump_force
		player.jumps_left = player.TOTAL_JUMPS - 1

func physics_update(delta):
	var direction = Input.get_axis("move_left", "move_right")
	var speed = player.run_speed if Input.is_action_pressed("run") else player.walk_speed
	if direction != 0:
		var target_rotation = PI/3 if direction > 0 else -PI/3
		player.player_model.rotation.y = lerp_angle(
			player.player_model.rotation.y,
			target_rotation,
			player.rotation_speed * delta
		)
		player.facing_direction = direction
	player.velocity.x = direction * speed
	
	if Input.is_action_just_pressed("jump") and player.jumps_left > 0:
		player.velocity.y = player.jump_force
		player.jumps_left -= 1
	
	if Input.is_action_just_pressed("fast_fall"):
		state_machine.change_state($"../FastFallState")
	
	if player.is_on_floor():
		if direction == 0:
			state_machine.change_state($"../IdleState")
		else:
			state_machine.change_state($"../MoveRunState")
	if Input.is_action_just_pressed("attack_button"):
		state_machine.change_state($"../AttackState")
