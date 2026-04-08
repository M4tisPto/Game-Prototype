extends State

func enter():
	player.jumps_left = player.TOTAL_JUMPS

func physics_update(delta):
	var direction = Input.get_axis("move_left", "move_right")
	
	player.velocity.x = move_toward(player.velocity.x, 0, player.walk_speed * player.deceleration)
	

	if direction != 0:
		state_machine.change_state($"../RunState")
	
	# Salto
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		state_machine.change_state($"../AirState")
	
	# Slam en aire
	if Input.is_action_just_pressed("ground_slam") and not player.is_on_floor():
		state_machine.change_state($"../SlamState")
