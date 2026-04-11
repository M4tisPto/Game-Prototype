extends State

func get_state_name():
	return "idle"

func enter():
	player.jumps_left = player.TOTAL_JUMPS

func physics_update(delta):
	var direction = Input.get_axis("move_left", "move_right")
	
	player.velocity.x = move_toward(player.velocity.x, 0, player.walk_speed * player.deceleration)
	
	if direction != 0:
		player.facing_direction = direction
		state_machine.change_state($"../MoveRunState")
	
	# Jump
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		state_machine.change_state($"../AirState")
	
	# FastFall
	if Input.is_action_just_pressed("fast_fall") and not player.is_on_floor():
		state_machine.change_state($"../FastFallState")
	
	if Input.is_action_just_pressed("attack_button"):
		state_machine.change_state($"../AttackState")
