extends State

func get_state_name():
	return "Move and run"

func physics_update(delta):
	if player.attack:
		return

	var direction = Input.get_axis("move_left", "move_right")
	var speed = player.run_speed if Input.is_action_pressed("run") else player.walk_speed
	
	player.velocity.x = move_toward(player.velocity.x, direction * speed, speed * player.acceleration)

	if direction != 0:
		var target_rotation = PI/3 if direction > 0 else -PI/3
		player.player_model.rotation.y = lerp_angle(
			player.player_model.rotation.y,
			target_rotation,
			player.rotation_speed * delta
		)
		player.facing_direction = sign(direction)


	if Input.is_action_just_pressed("attack_button"):
		state_machine.change_state($"../AttackState")
		return

	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		state_machine.change_state($"../AirState")
		return

	if direction == 0:
		state_machine.change_state($"../IdleState")
		return
